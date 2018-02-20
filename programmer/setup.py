from setuptools import setup, find_packages
setup(
  name = 'tinyprog',
  packages = find_packages(),
  install_requires = ['pyserial'],
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
