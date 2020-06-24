#detailed team review base on team ,using 2 tables (match and teams) showing rounding off,avg,count,group by ,order by  and inner joins    

select season,team_name,
count(match.home_team_api_id+match.away_team_api_id)as total_match_played,
round(avg(home_team_goals+away_team_goals))as avg_goals ,
round(avg(home_team_goals))as avg_home_goals,
round(avg(away_team_goals))as avg_away_goals 
from match
inner join team 
on team.team_api_id=match.away_team_api_id and match.home_team_api_id
group by team_name
order by season DESC;








