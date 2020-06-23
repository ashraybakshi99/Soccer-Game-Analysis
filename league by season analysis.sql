#league by season using joins on 4 tables (match,country,team and league) 

select season,country.country_name,league.league_name,team.team_long_name as team_name,round(avg(home_team_goals))as avg_home_goals,round(avg(away_team_goals))as avg_away_goals
,round(avg(away_team_goals+home_team_goals)) as avg_total_goals,round(avg(home_team_goals-away_team_goals))as avg_goal_difference from country
inner join match 
on country.country_id=match.country_id
inner join league
on league.league_id=match.league_id
inner join team
on team.team_api_id=match.away_team_api_id
where country_name in ('Spain',
'Italy', 
'France', 
'Germany',
'England')
group by country_name
order by avg_home_goals DESC


