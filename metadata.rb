name 'Trimmomatic'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures Trimmomatic'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.0'

source_url 'https://github.com/EagleGenomics-cookbooks/Trimmomatic'
issues_url 'https://github.com/EagleGenomics-cookbooks/Trimmomatic/issues'

# depends 'build-essential'
depends 'magic_shell'
depends 'java'
