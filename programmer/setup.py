import os
import subprocess
import sys
from setuptools import setup, find_packages

GIT_DESCRIBE_CMD = 'git describe --dirty --tags --long --match tinyprog-*.*'

full_version_path = os.path.join(
    os.path.dirname(__file__), "tinyprog", "full_version.py")
try:
    full_version = subprocess.check_output(GIT_DESCRIBE_CMD, shell=True)
    with open(full_version_path, "w") as fh:
        fh.write('__full_version__ = "%s"\n' % full_version.strip())
except subprocess.CalledProcessError as e:
    sys.stderr.write(str(e))
    sys.stderr.write('\n')

with open("README.md", "rb") as fh:
    long_description = fh.read().decode('utf-8')

short_description = """
Programmer for FPGA boards using the TinyFPGA USB Bootloader
 (http://tinyfpga.com).
""".replace("\n", "").replace("\r", "").strip()
# short description should not have newlines or start/ending spaces.
assert len(short_description.splitlines()) == 1

setup(
    name='tinyprog',
    packages=find_packages(),
    install_requires=[
        'pyserial>=3,<4', 'jsonmerge>=1.4.0,<2', 'intelhex>=2.2.1,<3',
        'tqdm>=4.19.5,<5', 'six', 'packaging', 'pyusb'
    ],
    use_scm_version={
        "root": "..",
        "relative_to": __file__,
        'git_describe_command': GIT_DESCRIBE_CMD,
    },
    setup_requires=['setuptools_scm'],
    description=short_description,
    long_description=long_description,
    long_description_content_type="text/markdown",
    author='Luke Valenty',
    author_email='luke@tinyfpga.com',
    url='https://github.com/tinyfpga/TinyFPGA-Bootloader/',
    project_urls={
        'Documentation':
            'https://packaging.python.org/tutorials/distributing-packages/',
        'Source':
            'https://github.com/tinyfpga/TinyFPGA-Bootloader/tree/master/programmer', # noqa
        'Tracker':
            'https://github.com/tinyfpga/TinyFPGA-Bootloader/issues',
    },
    license='GPLv3+',
    keywords=['fpga', 'tinyfpga', 'programmer', 'lattice', 'ice40'],
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Environment :: Console', 'Intended Audience :: Developers',
        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3',
        'Programming Language :: Python :: 3.5',
        'Programming Language :: Python :: 3.6',
        'Programming Language :: Python :: 3.7',
    ],
    entry_points={'console_scripts': ['tinyprog = tinyprog.__main__:main']},
)
