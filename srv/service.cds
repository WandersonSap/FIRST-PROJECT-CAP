using { cap.l2l.first.project as db} from '../db/schema';

service Main @(path: '/main') {

    entity Customers as projection on db.Customers;
    entity Orders    as projection on db.Orders;
    entity Nfs       as projection on db.Nfs;

}