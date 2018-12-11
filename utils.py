#!/usr/bin/python3
"""
Simulated shell commands for campatibilities
"""

import inspect
import os
import shutil
import stat
import subprocess
import sys
import datetime


HOME = os.getenv('HOME')

"""
laction map schema: {
    <dotfile cluster>: {
        <file name>: [<operand>, <...path>]
    }
}

operands: +         for create file(backup&override if exists)
          otherwise means append contents to the target path file
"""
LOCATIONS_MAP = {
    'vscode': {  # TODO complicated
        #
    },
    'bash': {  # deprecated
        # '.bashrc': {},
        # '.bash_profile': {},
        # '.bash_aliases': {}
    },
    'fish': {  # deprecated
        #
    },
    'ghci': {
        'ghci.conf': ['+', '~', '.ghc/ghci.conf']
    },
    'git': {  # TODO complicated
        #
    },
    'python': {
        '.pythonrc': ['+', '~', '.pythonrc.py']
    },
    'tmux': {
        '.tmux.conf': [r'source-file "${HOME}/.dotfiles/.tmux.conf"', '~', '.tmux.conf']
    },
    'zsh': {
        '.zshrc': ['source $HOME/.dotfiles/zsh/.zshrc', '~', '.zshrc']
    }
}


def remove_and_symlink(target, name):
    try:
        if os.name == 'nt' and os.path.isdir(name):
            os.rmdir(name)
        else:
            os.unlink(name)
    except EnvironmentError:
        pass

    os.symlink(target, name)


def touch(fname):
    if os.path.exists(fname):
        os.utime(fname, None)
    else:
        open(fname, 'a').close()


def rmrf(_dir):
    def on_error(f, path, _):  # rm readonly
        os.chmod(path, stat.S_IWRITE)
        f(path)

    shutil.rmtree(_dir, onerror=on_error)


def make_env(merge_env={}, env=None):
    if env is None:
        env = os.environ
    env = env.copy()
    env.update(merge_env)

    return env


def run(args, quiet=False, cwd=None, env=None, merge_env={}):
    args[0] = os.path.normpath(args[0])
    if not quiet:
        print(' '.join(args))
    env = make_env(env=env, merge_env=merge_env)
    shell = os.name == "nt"  # run .bat in shell
    rc = subprocess.call(args, cwd=cwd, env=env, shell=shell)
    if rc:
        sys.exit(rc)


def processer(operand, path, cluster_name, target_name):
    if operand == '+':
        if os.path.exists(path):
            datehash = datetime.datetime.now().isoformat()
            os.rename(path, path + datehash + '.backup')
        content = open(os.path.join(os.curdir, cluster_name, target_name), 'rt').readlines()
        with open(path, 'wt') as f:
            f.writelines(content)
    if not os.path.exists(path):
        with open(path, 'wt') as f:
            pass
    lines = open(path, 'rt').readlines()
    if any(line for line in lines if line.startswith(operand)):
        return
    lines.append(os.linesep)
    lines.append(operand + os.linesep)
    with open(path, 'wt') as f:
        f.writelines(lines)


def worker(quiet=False):
    for cluster_name in LOCATIONS_MAP:
        cluster = LOCATIONS_MAP[cluster_name]
        for target_name in cluster:
            if not quiet:
                print('Working on:', cluster_name, target_name)
            target = cluster[target_name]
            operand = target[0]
            path = os.path.join(*(p if p != '~' else HOME for p in target[1:]))
            processer(operand, path, cluster_name, target_name)


def main(fn):
    """TODO CLI argv parser"""
    locale = inspect.stack()[1][0].f_locals
    module = locale.get('__name__', None)
    if module == '__main__':
        locale[module] = fn
        args = sys.argv[1:]
        fn(*args)
    return fn


@main
def _main():
    print(1)
    # worker()
