from setuptools import setup, find_packages
setup(
  name = 'tinyprog',
  packages = find_packages(),
  install_requires=[
    'pyserial>=3,<4',
    'jsonmerge>=1.4.0,<2',
    'intelhex>=2.2.1,<3',
    'tqdm>=4.19.5,<5'
  ],
  version = '1.0.5',
  description = 'Programmer for FPGA boards using the TinyFPGA USB Bootloader (http://tinyfpga.com)',
  author = 'Luke Valenty',
  author_email = 'luke@tinyfpga.com',
  url = 'https://github.com/tinyfpga/TinyFPGA-Bootloader/', 
  keywords = ['fpga', 'tinyfpga', 'programmer'], 
  classifiers=[
    'Development Status :: 5 - Production/Stable',
    'Environment :: Console',
    'Intended Audience :: Developers',
    'License :: OSI Approved :: GNU General Public License v2 (GPLv2)',
    'Programming Language :: Python :: 2',
    'Programming Language :: Python :: 3'
  ],
  entry_points = {
    'console_scripts': [
        'tinyprog = tinyprog.__main__:main'    
    ]    
  },
)
