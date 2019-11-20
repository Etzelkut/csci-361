delete from leg_of_route;
delete from route;
delete from station;
delete from user;
insert into user(userid, fname, lname, email, username, status) values(101, 'Petr', 'Pavl', 'peter.pavl@gmail.com', 'peter.pavl','Manager');
insert into user(userid, fname, lname, email, username, status) values(102, 'Kos', 'Tan', 'kos.tan@gmail.com', 'kos.tan','Manager');
insert into user(userid, fname, lname, email, username, status) values(103, 'Kokshe', 'Tau', 'kokshe.tau@gamil.com', 'kokshe.tau','Manager');
insert into user(userid, fname, lname, email, username, status) values(104, 'Nur', 'Sultan', 'nur.sultan@gmail.com', 'nur.sultan','Manager');
insert into user(userid, fname, lname, email, username, status) values(105, 'Pav', 'Lod', 'pav.lod@gmail.com', 'pav.lod','Manager');
insert into user(fname, lname, email, username, status, password) values('Adilet', 'Mukashev', 'adilet.mukashev@nu.edu.kz', 'adilet.mukashev','Agent','322206zZ');
insert into user(fname, lname, email, username, status, password) values('Agakhan', 'Baiturov', 'a98a98@gmail.com', 'aga.bai','Passenger', '12345');


insert into station values(101, 'Petropavl', 101);
insert into station values(102, 'Kostanay', 102);
insert into station values(103, 'Kokshetau', 103);
insert into station values(104, 'Nur-Sultan', 104);
insert into station values(105, 'Pavlodar', 105);


insert into route(First_Station,Last_Station) values(104,101);
insert into route(First_Station,Last_Station) values(101,104);
insert into route(First_Station,Last_Station) values(102,103);
insert into route(First_Station,Last_Station) values(103,102);
insert into route(First_Station,Last_Station) values(104,105);
insert into route(First_Station,Last_Station) values(105,104);

delete from train;
insert into train(Train_model) values ("Talgo");
insert into train(Train_model) values ("Express");
insert into train(Train_model) values ("Express");

delete from leg_of_route;
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE(NOW()),' 00:08:00'), CONCAT(DATE(NOW()),' 00:11:00'),104,103,1,1,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:08:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:11:00'),104,103,1,1,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:08:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:11:00'),104,103,1,1,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:08:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:11:00'),104,103,1,1,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE(NOW()),' 00:11:00'), CONCAT(DATE(NOW()),' 00:16:00'),103,101,1,2,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:11:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:16:00'),103,101,1,2,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:11:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:16:00'),103,101,1,2,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:11:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:16:00'),103,101,1,2,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE(NOW()),' 00:17:00'), CONCAT(DATE(NOW()),' 00:22:00'),101,103,2,1,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:17:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:22:00'),101,103,2,1,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:17:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:22:00'),101,103,2,1,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:17:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:22:00'),101,103,2,1,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE(NOW()),' 00:22:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:01:00'),103,104,2,2,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:22:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:01:00'),103,104,2,2,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:22:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:01:00'),103,104,2,2,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:22:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 4 DAY),' 00:01:00'),103,104,2,2,1);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE(NOW()),' 00:12:00'), CONCAT(DATE(NOW()),' 00:15:00'),103,102,3,1,2);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:12:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:15:00'),103,102,3,1,2);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:12:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:15:00'),103,102,3,1,2);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:12:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:15:00'),103,102,3,1,2);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE(NOW()),' 00:16:00'), CONCAT(DATE(NOW()),' 00:19:00'),102,103,4,1,2);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:16:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:19:00'),102,103,4,1,2);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:16:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:19:00'),102,103,4,1,2);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:16:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:19:00'),102,103,4,1,2);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE(NOW()),' 00:12:00'), CONCAT(DATE(NOW()),' 00:15:00'),104,105,5,1,3);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:12:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:15:00'),104,105,5,1,3);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:12:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:15:00'),104,105,5,1,3);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:12:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:15:00'),104,105,5,1,3);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE(NOW()),' 00:16:00'), CONCAT(DATE(NOW()),' 00:19:00'),105,104,6,1,3);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:16:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 1 DAY),' 00:19:00'),105,104,6,1,3);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:16:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 2 DAY),' 00:19:00'),105,104,6,1,3);
insert into leg_of_route(Date_dep,Date_arr, Station_dep,Station_arr,RouteID,Serial_number_in_route,train_ID) values(CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:16:00'), CONCAT(DATE_ADD(DATE(NOW()), INTERVAL 3 DAY),' 00:19:00'),105,104,6,1,3);



delete from vagon;
insert into vagon(train_id, vagon_type,vagon_num) values(1, 'Lux', 1);
insert into vagon(train_id, vagon_type,vagon_num) values(1, 'Lux', 2);
insert into vagon(train_id, vagon_type,vagon_num) values(1, 'Lux', 3);
insert into vagon(train_id, vagon_type,vagon_num) values(1, 'Coupe', 4);
insert into vagon(train_id, vagon_type,vagon_num) values(1, 'Coupe', 5);
insert into vagon(train_id, vagon_type,vagon_num) values(1, 'Coupe', 6);
insert into vagon(train_id, vagon_type,vagon_num)values(1, 'Default', 7);
insert into vagon(train_id, vagon_type,vagon_num) values(1, 'Default', 8);
insert into vagon(train_id, vagon_type,vagon_num) values(1, 'Default', 9);
insert into vagon(train_id, vagon_type,vagon_num) values(2, 'Lux', 1);
insert into vagon(train_id, vagon_type,vagon_num) values(2, 'Lux', 2);
insert into vagon(train_id, vagon_type,vagon_num) values(2, 'Lux', 3);
insert into vagon(train_id, vagon_type,vagon_num) values(2, 'Coupe', 4);
insert into vagon(train_id, vagon_type,vagon_num) values(2, 'Coupe', 5);
insert into vagon(train_id, vagon_type,vagon_num) values(2, 'Coupe', 6);
insert into vagon(train_id, vagon_type,vagon_num) values(2, 'Default', 7);
insert into vagon(train_id, vagon_type,vagon_num) values(2, 'Default', 8);
insert into vagon(train_id, vagon_type,vagon_num) values(2, 'Default', 9);
insert into vagon(train_id, vagon_type,vagon_num) values(3, 'Lux', 1);
insert into vagon(train_id, vagon_type,vagon_num) values(3, 'Lux', 2);
insert into vagon(train_id, vagon_type,vagon_num) values(3, 'Lux', 3);
insert into vagon(train_id, vagon_type,vagon_num) values(3, 'Coupe', 4);
insert into vagon(train_id, vagon_type,vagon_num) values(3, 'Coupe', 5);
insert into vagon(train_id, vagon_type,vagon_num) values(3, 'Coupe', 6);
insert into vagon(train_id, vagon_type,vagon_num) values(3, 'Default', 7);
insert into vagon(train_id, vagon_type,vagon_num) values(3, 'Default', 8);
insert into vagon(train_id, vagon_type,vagon_num) values(3, 'Default', 9);

delete from ticket;
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(1 ,1, 'Lux', 1,1,1,DATE(NOW()),106,"Adil");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(2 ,1, 'Lux', 1,1,1,DATE(NOW()),106,"Let");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(3 ,1, 'Lux', 1,1,1,DATE(NOW()),106,"Adilet");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(4 ,1, 'Lux', 1,1,1,DATE(NOW()),106,"Alet");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(5 ,1, 'Lux', 1,1,1,DATE(NOW()),106,"Dil");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(6 ,1, 'Lux', 1,1,1,DATE(NOW()),106,"Et");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(11 ,1, 'Lux', 1,1,1,DATE(NOW()),106,"LilAdilet");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(1 ,1, 'Lux', 1,1,2,DATE(NOW()),106,"BigAdilet");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(7 ,1, 'Lux', 2,2,1,DATE(NOW()),107, "LilBai");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(2 ,1, 'Lux', 2,2,1,DATE(NOW()),107, "BigBai");
insert into ticket(seat_number,train_ID,vagon_type, leg_serial_number, RouteID, Vagon_num,Date,PassID,Pass_Name) values(3 ,1, 'Lux', 2,2,1,DATE(NOW()),107, "MiddleBai");