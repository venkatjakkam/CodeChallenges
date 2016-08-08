create table csi.PositiveNumbers
(
    Value int not null,
    leftsum int,
    rightsum int,
    rn int not null
);




insert into csi.PositiveNumbers(value,rn) values (24,1);
insert into csi.PositiveNumbers(value,rn) values (6,2);
insert into csi.PositiveNumbers(value,rn) values (2,3);
insert into csi.PositiveNumbers(value,rn) values (15,4);
insert into csi.PositiveNumbers(value,rn) values (26,5);
insert into csi.PositiveNumbers(value,rn) values (73,6);
insert into csi.PositiveNumbers(value,rn) values (10,7);
insert into csi.PositiveNumbers(value,rn) values (13,8);
insert into csi.PositiveNumbers(value,rn) values (50,9);
commit;
