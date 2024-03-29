
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Use Log::Any to control logging from your Dancer app",
  "AUTHOR" => "Michael Alan Dorman <mdorman\@ironicdesign.com>",
  "BUILD_REQUIRES" => {
    "Dancer" => 0,
    "Dancer::Test" => 0,
    "Log::Any::Test" => 0,
    "Test::More" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Dancer-Logger-LogAny",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Dancer::Logger::LogAny",
  "PREREQ_PM" => {
    "Dancer::Config" => 0,
    "Dancer::Logger::Abstract" => 0,
    "Log::Any" => 0,
    "Log::Any::Adapter" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.002",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



