drop table if exists t_event cascade; 

drop table if exists m_user cascade; 

create table if not exists t_event( 
  event_id serial not null
  , user_id int4 not null
  , title varchar (255) not null
  , detail varchar (255)
  , 
  start date not null
  , primary key (event_id)
); 

create table if not exists m_user( 
  user_id serial not null
  , name varchar (255) not null
  , primary key (user_id)
); 

insert 
into m_user(user_id, name) 
values (1, 'test'); 

insert 
into t_event(event_id, user_id, title, start) 
values (1, 1, 'test', now()); 



