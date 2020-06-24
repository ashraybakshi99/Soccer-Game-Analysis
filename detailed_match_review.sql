#detailed match review using 4 tables (match,league,country,team) showing inner join,group by,order by,cases and subquries
 
select season,match.match_id,country.country_name,league_name,
      (select team.team_name from team
       where team_api_id in (match.home_team_api_id))as team_1,
      (select team.team_name from team
       where team_api_id in (match.away_team_api_id))as team_2,(home_team_goals)as team_1_goals
	   ,(away_team_goals) as team_2_golas, 
	   case 
	   when home_team_goals>away_team_goals THEN 'win_team1'
	   when home_team_goals=away_team_goals THEN 'DRAW'
	   else 'win_team2'
	   END as  'match_result'
	   from match
inner join country
on country.country_id=match.Country_id
inner join league
on league.league_id=match.league_id
 join team 
on team.team_api_id=match.away_team_api_id and match.home_team_api_id
group by team_1
order by season DESC;


