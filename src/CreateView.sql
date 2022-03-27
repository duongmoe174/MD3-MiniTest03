use quanlyvatlieu;

create view vw_CTPNHAP as
select rn.code, m.code as material_code, rnd.number, rnd.importPrice, rnd.importPrice*rnd.number as total_import_price
from receivednote rn join receivednotedetail rnd on rn.id = rnd.receivedNote_id join material m on rnd.material_id = m.id;
select * from vw_CTPNHAP;

create view vw_CTPNHAP_VT as
    select rn.code as received_code, m.code as material_code, m.name as material_name, rnd.importPrice, rnd.number, rnd.importPrice*rnd.number as total_import_price
    from receivednote rn join receivednotedetail rnd on rn.id = rnd.receivedNote_id join material m on m.id = rnd.material_id;
select * from vw_CTPNHAP_VT;

create view vw_CTPNHAP_VT_PN as
select rn.code as received_code, rn.importDate, t.code as order_code, m.code as material_code, m.name as material_name, rnd.number as received_number, rnd.importPrice, rnd.number*rnd.importPrice as total_import_price
from receivednote rn join receivednotedetail rnd on rn.id = rnd.receivedNote_id join material m on m.id = rnd.material_id join theorder t on rn.theOrder_id = t.id;
select * from vw_CTPNHAP_VT_PN;

create view vw_CTPNHAP_VT_PN_DH as
select rn.code as received_code, rn.importDate, t.code as order_code, s.code as supplier_code, s.name as supplier_name, m.code as material_code, m.name as material_name, rnd.number as received_number, rnd.importPrice, rnd.number*rnd.importPrice as total_import_price
from receivednote rn join receivednotedetail rnd on rn.id = rnd.receivedNote_id join material m on m.id = rnd.material_id join theorder t on rn.theOrder_id = t.id join supplier s on t.supplier_id = s.id;
select * from vw_CTPNHAP_VT_PN_DH;

create view vw_CTPNHAP_LOC as
    select rn.code as received_code, m.code as materail_code, rnd.number as received_number, rnd.importPrice, rnd.number*rnd.importPrice as total_import_price
    from receivednote rn join receivednotedetail rnd on rn.id = rnd.receivedNote_id join material m on m.id = rnd.material_id
where rnd.number > 5;
select * from vw_CTPNHAP_LOC;

create view vw_CTPNHAP_VT_LOC as
select rn.code as received_code, m.code as materail_code, m.name as material_name, rnd.number as received_number, rnd.importPrice, rnd.number*rnd.importPrice as total_import_price
from receivednote rn join receivednotedetail rnd on rn.id = rnd.receivedNote_id join material m on m.id = rnd.material_id
where m.currency = 'Bo';
select * from vw_CTPNHAP_VT_LOC;

create view vw_CTPXUAT as
    select dn.code as delivery_code, m.code as material_code, dnd.number as export_number, dnd.exportPrice, dnd.number*dnd.exportPrice as total_export_price
    from deliverynote dn join deliverynotedetail dnd on dn.id = dnd.deliveryNote_id join material m on dnd.material_id = m.id;

create view vw_CTPXUAT_VT as
select dn.code as delivery_code, m.code as material_code, m.name as material_name, dnd.number as export_number, dnd.exportPrice, dnd.number*dnd.exportPrice as total_export_price
from deliverynote dn join deliverynotedetail dnd on dn.id = dnd.deliveryNote_id join material m on dnd.material_id = m.id;

create view vw_CTPXUAT_VT_PX as
select dn.code as delivery_code, dn.customerName, m.code as material_code, m.name as material_name, dnd.number as export_number, dnd.exportPrice, dnd.number*dnd.exportPrice as total_export_price
from deliverynote dn join deliverynotedetail dnd on dn.id = dnd.deliveryNote_id join material m on dnd.material_id = m.id;