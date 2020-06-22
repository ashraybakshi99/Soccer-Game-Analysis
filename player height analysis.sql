
#finding the range and rounding off the values 
select player_name,
CASE
when round(height)<157 then 157
when round(height)>208 then 208
else round(height)
end as calc_height
from players
limit 10

#merged two tables(players and player_attributes) using left join,player_attribute being part of subquries and then finding range of the players height 
select player_name,
CASE
when round(height)<157 then 157
when round(height)>208 then 208
else round(height)
end as calc_height
from players
left join
(select player_attributes.player_api, avg(player_attributes.overallrating) as overall_rating, avg(player_attributes.potential) 
from player_attributes
group by player_attributes.player_api) as PA_grouped
on players.player_api_id = PA_Grouped.player_api
limit 10
 
#printing avg values of overall_rating and potential corresponding to the players height in the database
select player_name,
CASE
when round(height)<157 then 157
when round(height)>208 then 208
else round(height)
end as calc_height
,avg(PA_grouped.Overall_rating)as avg_overallrating ,avg(PA_grouped.avg_potential)as avg_potential1
from players
left join
(select player_attributes.player_api_id, avg(player_attributes.Overall_rating) as overall_rating, avg(player_attributes.potential) as avg_potential 
from player_attributes
group by player_attributes.player_api_id) as PA_grouped
on players.player_api_id = PA_Grouped.player_api_id
group by height
order by calc_height DESC