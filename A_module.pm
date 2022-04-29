package A_module;

=head1 NAME

  manage functions

=cut

use strict;
our $VERSION = 2.00;
use parent 'dbcore';
my ($admin, $CONF);

#**********************************************************
# Init
#**********************************************************
sub new {
  my $class = shift;
  my $db    = shift;
  ($admin, $CONF) = @_;

  my $self = {
    db => $db,
    admin => $admin,
    conf  => $CONF
    };

  bless($self, $class);

  return $self;
}


#**********************************************************
=head1 NAME
  Add customer to database 'customers'
=cut
#**********************************************************
sub customer_add {
  my $self = shift;
  my ($attr) = @_;

  $self -> query_add('customers', $attr);

  # $self->query("INSERT INTO customers (name, address)
  #   VALUES ('$attr->{NAME}', '$attr->{ADDRESS_STREET}');",
  #   'do', {}
  # );

  return $self;
}

#**********************************************************
=head1
  Get list of customers from database
=cut
#**********************************************************
sub customer_list {
  my $self = shift;
  my ($attr) = @_;

  # my $SORT      = ($attr->{SORT})      ? $attr->{SORT}      : 1;
  # my $DESC      = ($attr->{DESC})      ? $attr->{DESC}      : '';
  # my $PG        = ($attr->{PG})        ? $attr->{PG}        : 0;
  # my $PAGE_ROWS = ($attr->{PAGE_ROWS}) ? $attr->{PAGE_ROWS} : 25;
  #
  # my @WHERE_RULES = ();
  #
  # my $WHERE =  $self->search_former($attr, [
  #   [ 'ID',               'INT', 'customers.id',              1 ],
  #   [ 'NAME',             'STR', 'customers.name',            1 ],
  #   [ 'ADDRESS',          'STR', 'customers.address_street',  1 ],
  # ],
  #   { WHERE       => 1,
  #     WHERE_RULES => \@WHERE_RULES,
  #   });

  $self->query("
    SELECT *
    FROM customers
    ;", undef, {COLS_NAME => 1, COLS_UPPER => 1}
  );

  my $list = $self->{list};
  return $list;
}

#**********************************************************
=head1
  Show info about customer
=cut
#**********************************************************
sub customer_chg {
  my $self = shift;
  my ($attr) = @_;

  $self->query("SELECT *
   FROM customers
   WHERE id = ?;",
   undef,
   { COLS_NAME => 1,
     COLS_UPPER => 1,
     Bind => [ $attr->{ID} ] });

  # return $self->{list}->[0] || {};
  return $self;
}

#**********************************************************
=head1
  Change customer
=cut
#**********************************************************
sub customer_change {
  my $self = shift;
  my ($attr) = @_;

  $self->changes({
    CHANGE_PARAM => 'ID',
    TABLE        => 'customers',
    DATA         => $attr
  });

  return $self;
}

#**********************************************************
=head1
  Delete customer (not ready!!!!)
=cut
#**********************************************************
sub customer_del {
  my $self = shift;
  my ($attr) = @_;

  $self->query_del('customers', $attr);

  return $self;
}

1