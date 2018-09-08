import os
import shutil
import stat
import subprocess
import sys


HOME = os.path.dirname('/home')


def remove_and_symlink(target, name, is_dir=False):
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
    for key in merge_env.keys():
        env[key] = merge_env[key]
    return env


def run(args, quiet=False, cwd=None, env=None, merge_env={}):
    args[0] = os.path.normpath(args[0])
    if not quiet:
        print(' '.join(args))
    env = make_env(env=env, merge_env=merge_env)
    shell = os.name == "nt"  # Run through shell to make .bat/.cmd files work.
    rc = subprocess.call(args, cwd=cwd, env=env, shell=shell)
    if rc != 0:
        sys.exit(rc)
