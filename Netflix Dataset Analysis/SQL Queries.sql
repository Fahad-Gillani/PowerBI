--create view TotalCount_Movie_TVShows
as
select type,count(type)as [Count] from netflixTB group by type
select * from TotalCount_Movie_TVShows

--create view Top10_ParentGuided_Movies
as
select top(10) title,type,director,country,release_year,rating,duration,duation_Unit,listed_in from netflixTB
where rating like 'PG%' order by duration DESC 
select * from Top10_ParentGuided_Movies

--Type by Avg Release Year and MAX/MIN Duration
select type,avg(release_year) as AVG_ReleaseYear,max(duration) as MAX_Duration 
,min(duration) as MIN_Duration from netflixTB group by type 

--Rating Count
select rating,Count(rating) as Count from netflixTB group by rating
order by count(rating) DESC

--TOP 10 ADULT TV Shows
select top(10) title,type,country,release_year,rating,duration,duation_Unit,listed_in from netflixTB 
where rating in ('TV-MA','R','NC-17') and duation_Unit like 'Season%'
order by duration DESC

--Movies/Shows by Director having count b/w 15 and 20 
select distinct director,count(title) as Count from NetflixTB group by director 
having count(*) between 15 and 20

--Releases by Year between 2015 and 2018
select release_year,count(*) as Count from netflixTB where release_year between '2015' and '2018'
group by release_year having count(*)>500
