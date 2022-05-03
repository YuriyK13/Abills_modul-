package A_module;

=head2

 Customer Manage functions

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
=head1 customer_add ($attr) - Add customer to database 'customers'

  Arguments:
    $attr - hash_ref

=cut
#**********************************************************
sub customer_add {
  my $self = shift;
  my ($attr) = @_;

  $self -> query_add('customers', $attr);

  return $self;
}

#**********************************************************
=head1 customer_list ($attr) - returns list of all customers

  Arguments:
    $attr - hash_ref

  Returns:
    Customer list
     id
     name
     address_street
=cut
#**********************************************************
sub customer_list {
  my $self = shift;
  my ($attr) = @_;

  $self->query("
    SELECT *
    FROM customers
    ;", undef, $attr
  );

  my $list = $self->{list};
  return $list;
}

#**********************************************************
=head2 customer_info ($attr) - Show info about customer

  Arguments:
    $attr

  Returns:
    Customer list
     name
     address_street

=cut
#**********************************************************
sub customer_info {
  my $self = shift;
  my ($attr) = @_;

  $self->query("SELECT *
   FROM customers
   WHERE id = ?;",
   undef,
   { INFO => 1,
     Bind => [ $attr->{ID} ]
   }
  );

  return $self;
}

#**********************************************************
=head2 customer_change ($attr) - update customer info

  Arguments:
    $attr

  Returns:
    Customer list
     name
     address_street

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
=head1 customer_del ($attr) - Delete customer

  Arguments:
    $attr

=cut
#**********************************************************
sub customer_del {
  my $self = shift;
  my ($attr) = @_;

  $self->query_del('customers', $attr);

  return $self;
}

1