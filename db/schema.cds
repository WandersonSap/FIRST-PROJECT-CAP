namespace cap.l2l.first.project;

using { cuid, managed  } from '@sap/cds/common';


entity Customers : cuid, managed {
    name    : String(100)   @description: 'Nome';
    age     : Integer       @description: 'Idade'; 
    //orders   : Association to many Orders on orders.customer = $self;   
    orders   : Composition of  many Orders on orders.customer = $self;      
}

entity Orders : cuid, managed {
    amount      : Decimal;
    customer    : Association to one Customers;
    nf          : Composition of one Nfs on nf.order = $self
}

entity Nfs : cuid {
    id_fiscal   : String;
    order       : Association to Orders
}