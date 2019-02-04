select staff.fname, staff.lname, count(event_staff.event_id) from staff inner join event_staff on staff.ssn=event_staff.ssn group by staff.fname, staff.lname;
select maincourse.maincourse_id, maincourse.description 
from maincourse
where maincourse.maincourse_id 
not in (select menu.maincourse_id 
        from menu, event 
        where event.menu_id=menu.menu_id and event.event_type='Wedding Reception');
select distinct dish.dish_id,dish.description 
from dish inner join course_item on course_item.dish_id=dish.dish_id 
inner join maincourse on maincourse.maincourse_id=course_item.maincourse_id 
inner join menu on menu.maincourse_id=maincourse.maincourse_id 
inner join event on event.menu_id=menu.menu_id and event.start_hour>=18;
select staff.lname, staff.fname, event.event_type, count(*) as NumberofEvents
from staff inner join event_staff on event_staff.ssn=staff.ssn 
inner join event on event_staff.event_id=event.event_id
group by staff.lname, staff.fname, event.event_type;
select event.event_id, event.event_type, sum(staff.hourly_rate*event.duration) as cost
from event inner join event_staff on event.event_id=event_staff.event_id
inner join staff on staff.ssn=event_staff.ssn
group by event.event_id;