use quanlyvatlieu;
delimiter //
create procedure getQuantityMaterial (materialCode varchar(50))
begin
    select m.name as material_name, (w.export + w.firstStock + r.number) - (w.export + d.number) as total_material
        from warehouse w join material m on m.id = w.material_id
    join receivednotedetail r on m.id = r.material_id
    join deliverynotedetail d on m.id = d.material_id and m.code = materialCode;
end //
delimiter ;

call getQuantityMaterial('VT002');

delimiter //
create procedure getTotalExportPrice (materialCode varchar(50))
begin
    select d.number*d.exportPrice as total_export_price, m.name as material_name
        from deliverynotedetail d join material m on m.id = d.material_id and m.code = materialCode;
end //
delimiter ;
call getTotalExportPrice('VT002');

delimiter //
create procedure getNumber (materialCode varchar(50))
begin
    select w.firstStock from warehouse w join material m on m.id = w.material_id and m.code = materialCode ;
end //
delimiter ;
call getNumber('VT002');