# -----------------------------------------------------------------------------
#
#  Template::Nes::Inject by Skriptke
#  Copyright 2009 - 2010 Enrique F. Castañón Barbero
#
#  Include Nes templates in Template Toolkit.
#  Requires Nes 1.04 or higher
#
# -----------------------------------------------------------------------------

  package Template::Nes::Inject;
  
  use vars qw(@ISA);
  @ISA = qw( Nes::Template::Top );  

  our $VERSION = '0.00_1';

  use strict;
  use warnings;
  use Template;
  use Nes::Template;
  
  sub new {
    my $class = shift;
    my $self  = $class->SUPER::new( shift );

    $self->{'tt'} = Template->new();

    return $self;
  }
  
  sub process {
    my $self = shift;
    my $vars = shift;

    my $out = '';
    $self->{'tt'}->process($self->get_out_ref, $vars, \$out ) 
      || die "Template process failed: ", $self->{'tt'}->error(), "\n";
      
    $self->run($vars,$out);
  }

  
1;
__END__

=head1 NAME

Template::Nes::Inject - Include Nes templates in Template Toolkit.

=head1 SYNOPSIS

  my $top_template = Template::Nes::Inject->new({ 
                       template    => 'template.nhtml',
                       nes_top_dir => '/full/path/to/cgi-bin/nes' 
                     });

  my $vars = {
    title => "Test"
  };

  $top_template->process($vars);
  $top_template->out();  

=head1 DESCRIPTION

Allows the inclusion of Templates, Objects, Plugins, configuration files and 
generally, many features of Nes in Template Toolkit templates.

Not a Plugin, can mix Nes Tags and TT Directives in the templates:

  <html>
    <head>
      <title>[% title %]</title>
    </head>
    <body>

    {: # include by TT :}
    <p>[% INCLUDE head.nhtml %]</p>

    {: # include by Nes :}
    <p>{: include footer.nhtml :}</p>

    </body>
  </html>

Include Nes Templates, PHP, PYTHON and others live sample: 

  L<http://nes.sourceforge.net/hello_nes/tests-tt/index.cgi?action=Inludes>

Include Nes Objects live sample: 

  L<http://nes.sourceforge.net/hello_nes/tests-tt/index.cgi?action=Objects>

Nes Tags and Debug Info live sample: 

  L<http://nes.sourceforge.net/hello_nes/tests-tt/index.cgi?action=others>

=head1 SEE ALSO

Sample to use Nes; L<http://nes.sourceforge.net/>, 
L<Nes>, L<Nes::Tutorial>, L<Nes::nes.cfg> 

=head1 AUTHOR

Skriptke

=head1 VERSION

Version 0.01

=head1 COPYRIGHT

Copyright (c) Enrique F. Castanon Barbero. All rights reserved.

=head1 LICENSE

This program is free software; you can redistribute it
and/or modify it under the same terms and conditions as
GNU Public License (GPL).

This means that you can, at your option, redistribute it and/or 
modify it under either the terms the GNU Public License (GPL), 
or under the Perl Artistic License.

See http://dev.perl.org/licenses/

=head1 DISCLAIMER

THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS
OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A
PARTICULAR PURPOSE.

Use of this software in any way or in any form, source or binary,
is not allowed in any country which prohibits disclaimers of any
implied warranties of merchantability or fitness for a particular
purpose or any disclaimers of a similar nature.

IN NO EVENT SHALL I BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT,
SPECIAL, INCIDENTAL,  OR CONSEQUENTIAL DAMAGES ARISING OUT OF THE
USE OF THIS SOFTWARE AND ITS DOCUMENTATION (INCLUDING, BUT NOT
LIMITED TO, LOST PROFITS) EVEN IF I HAVE BEEN ADVISED OF THE
POSSIBILITY OF SUCH DAMAGE


=cut
