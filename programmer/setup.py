from setuptools import setup, find_packages

with open("README.md", "r") as fh:
    long_description = fh.read()

setup(
    name = 'tinyprog',
    packages = find_packages(),
    install_requires=[
        'pyserial>=3,<4',
        'jsonmerge>=1.4.0,<2',
        'intelhex>=2.2.1,<3',
        'tqdm>=4.19.5,<5',
        'six',
        'packaging',
        'pyusb'
    ],
    version = '1.0.23',
    description = 'Programmer for FPGA boards using the TinyFPGA USB Bootloader (http://tinyfpga.com)',
    long_description=long_description,
    long_description_content_type="text/markdown",
    author = 'Luke Valenty',
    author_email = 'luke@tinyfpga.com',
    url = 'https://github.com/tinyfpga/TinyFPGA-Bootloader/',
    project_urls={
        'Documentation': 'https://packaging.python.org/tutorials/distributing-packages/',
        'Source': 'https://github.com/tinyfpga/TinyFPGA-Bootloader/tree/master/programmer',
        'Tracker': 'https://github.com/tinyfpga/TinyFPGA-Bootloader/issues',
    },
    license='GPLv3+',
    keywords = ['fpga', 'tinyfpga', 'programmer', 'lattice', 'ice40'],
    classifiers=[
        'Development Status :: 5 - Production/Stable',
        'Environment :: Console',
        'Intended Audience :: Developers',
        'License :: OSI Approved :: GNU General Public License v3 (GPLv3)',
        'Programming Language :: Python :: 2',
        'Programming Language :: Python :: 2.7',
        'Programming Language :: Python :: 3'
        'Programming Language :: Python :: 3.5'
        'Programming Language :: Python :: 3.6'
        'Programming Language :: Python :: 3.7'
    ],
    entry_points = {
        'console_scripts': [
            'tinyprog = tinyprog.__main__:main'
        ]
    },
)
