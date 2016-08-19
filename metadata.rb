name 'trimmomatic'
maintainer 'Eagle Genomics'
maintainer_email 'chef@eaglegenomics.com'
license 'Apache v2.0'
description 'Installs/Configures trimmomatic'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.1.3'

source_url 'https://github.com/EagleGenomics-cookbooks/trimmomatic'
issues_url 'https://github.com/EagleGenomics-cookbooks/trimmomatic/issues'

depends 'apt'
depends 'java'
depends 'magic_shell'
