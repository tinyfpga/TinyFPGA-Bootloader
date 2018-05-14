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
  version = '1.0.0',
  description = 'Programmer for FPGA boards using the TinyFPGA USB Bootloader (http://tinyfpga.com)',
  author = 'Luke Valenty',
  author_email = 'luke@tinyfpga.com',
  url = 'https://github.com/tinyfpga/TinyFPGA-Bootloader/', 
  keywords = ['fpga', 'tinyfpga', 'programmer'], 
  classifiers = [],
  entry_points = {
    'console_scripts': [
        'tinyprog = tinyprog.__main__:main'    
    ]    
  },
)
