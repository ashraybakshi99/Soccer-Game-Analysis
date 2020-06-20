#table that shows date,countryname,league from tables country,match and team ,showing(where,group by,and limit)

select match.date1,country.country_name,league.league_name from country
inner join match
on match.country_id=country.country_id
inner join league
on match.league_id=league.league_id
where country_name in ('Belgium','Italy','France')
group by country_name
limit 5

# tables shows season team name and team goals  from tables match and team ,showing (group by,having,order by and limit)

select season,team_long_name as [team name],sum(home_team_goal),sum(away_team_goal) from Match
inner join Team
on team.Team_api_id=match.away_team_api_id
group by team_long_name
having sum(home_team_goal)>80 AND sum(away_team_goal)<100
order by season DESC
limit 10

#showing player id,player name,overall rating and potential from tables players and player attribute showing(groupby,orderby,having,limit)

select players.player_api_id as playerID ,players.player_name,Overallrating,potential from players
inner join player_attributes
on player_attributes.player_api_id=players.player_api_id
group by playerID
having potential<55 and Overallrating<55
order by Overallrating ASC
limit 10

# showing player name,player id,weight,height,birthday

select players.player_api_id,players.player_name,weight,height,Birthday from players
inner join player_attributes
on player_attributes.player_api_id=players.player_api_id
where player_name in ('Bogdan Milic','Abdoul Ba','Kristof van Hout','Abdoul Ba')
group by height
HAVING height>150 and weight>150
order by height ASC