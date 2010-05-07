use strict;
use warnings;

use ExtUtils::MakeMaker;

WriteMakefile(
  NAME      => 'Template::Nes::Inject',
  AUTHOR    => 'Skriptke',
  ABSTRACT  => 'Include Nes templates in Template Toolkit.',
  (eval { ExtUtils::MakeMaker->VERSION(6.21) } ? (LICENSE => 'perl') : ()),
  PREREQ_PM    => {
    "Template" => '2.22',
    "Nes" => '1.03.4',
  },
);
