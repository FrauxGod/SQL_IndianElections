
-- Total Seats
SELECT COUNT(parliament_constituency) AS Total_Seats 
FROM constituencywise_results
;

-- Calculate seats according to states
SELECT S.state, COUNT(CR.parliament_constituency) AS Seats
FROM constituencywise_results AS CR
JOIN 
statewise_results AS SR
ON SR.parliament_constituency = CR.parliament_constituency
JOIN 
States AS S
ON SR.state_id = S.state_id
GROUP BY S.state
ORDER BY Seats DESC
;

-- Total seats won by NDA alliance
SELECT SUM(PR.won) AS NDA_Total_Seats FROM partywise_results AS PR
where PR.party in ('Bharatiya Janata Party - BJP', 
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
;

--Seats Won by NDA Allianz Parties
SELECT PR.party AS NDA_Party, PR.won AS NDA_Seats_Won FROM partywise_results AS PR
WHERE PR.party in 
               ('Bharatiya Janata Party - BJP',
                'Telugu Desam - TDP', 
				'Janata Dal  (United) - JD(U)',
                'Shiv Sena - SHS', 
                'AJSU Party - AJSUP', 
                'Apna Dal (Soneylal) - ADAL', 
                'Asom Gana Parishad - AGP',
                'Hindustani Awam Morcha (Secular) - HAMS', 
                'Janasena Party - JnP', 
				'Janata Dal  (Secular) - JD(S)',
                'Lok Janshakti Party(Ram Vilas) - LJPRV', 
                'Nationalist Congress Party - NCP',
                'Rashtriya Lok Dal - RLD', 
                'Sikkim Krantikari Morcha - SKM')
ORDER BY PR.won DESC
;
                

--Total Seats Won by I.N.D.I.A. Allianz
SELECT SUM(PR.won) AS Total_INDIA_Seats FROM partywise_results AS PR
WHERE PR.party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) 
;


--Seats Won by I.N.D.I.A. Allianz Parties
SELECT PR.party AS INDIA_Parties, PR.won AS INDIA_Seats FROM partywise_results AS PR
WHERE PR.party in ('Indian National Congress - INC',
                'Aam Aadmi Party - AAAP',
                'All India Trinamool Congress - AITC',
                'Bharat Adivasi Party - BHRTADVSIP',
                'Communist Party of India  (Marxist) - CPI(M)',
                'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
                'Communist Party of India - CPI',
                'Dravida Munnetra Kazhagam - DMK',
                'Indian Union Muslim League - IUML',
                'Nat`Jammu & Kashmir National Conference - JKN',
                'Jharkhand Mukti Morcha - JMM',
                'Jammu & Kashmir National Conference - JKN',
                'Kerala Congress - KEC',
                'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
                'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
                'Rashtriya Janata Dal - RJD',
                'Rashtriya Loktantrik Party - RLTP',
                'Revolutionary Socialist Party - RSP',
                'Samajwadi Party - SP',
                'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
                'Viduthalai Chiruthaigal Katchi - VCK'
            ) ORDER BY INDIA_Seats DESC
;


--Add new column field in table partywise_results to get the Party Allianz as NDA, I.N.D.I.A and OTHER
ALTER TABLE partywise_results
ADD party_alliance VARCHAR(50);

UPDATE partywise_results
SET party_alliance = 'I.N.D.I.A'
WHERE party IN (
    'Indian National Congress - INC',
    'Aam Aadmi Party - AAAP',
    'All India Trinamool Congress - AITC',
    'Bharat Adivasi Party - BHRTADVSIP',
    'Communist Party of India  (Marxist) - CPI(M)',
    'Communist Party of India  (Marxist-Leninist)  (Liberation) - CPI(ML)(L)',
    'Communist Party of India - CPI',
    'Dravida Munnetra Kazhagam - DMK',	
    'Indian Union Muslim League - IUML',
    'Jammu & Kashmir National Conference - JKN',
    'Jharkhand Mukti Morcha - JMM',
    'Kerala Congress - KEC',
    'Marumalarchi Dravida Munnetra Kazhagam - MDMK',
    'Nationalist Congress Party Sharadchandra Pawar - NCPSP',
    'Rashtriya Janata Dal - RJD',
    'Rashtriya Loktantrik Party - RLTP',
    'Revolutionary Socialist Party - RSP',
    'Samajwadi Party - SP',
    'Shiv Sena (Uddhav Balasaheb Thackrey) - SHSUBT',
    'Viduthalai Chiruthaigal Katchi - VCK'
);

--NDA Alliance
UPDATE partywise_results
SET party_alliance = 'NDA'
WHERE party IN (
    'Bharatiya Janata Party - BJP',
    'Telugu Desam - TDP',
    'Janata Dal  (United) - JD(U)',
    'Shiv Sena - SHS',
    'AJSU Party - AJSUP',
    'Apna Dal (Soneylal) - ADAL',
    'Asom Gana Parishad - AGP',
    'Hindustani Awam Morcha (Secular) - HAMS',
    'Janasena Party - JnP',
    'Janata Dal  (Secular) - JD(S)',
    'Lok Janshakti Party(Ram Vilas) - LJPRV',
    'Nationalist Congress Party - NCP',
    'Rashtriya Lok Dal - RLD',
    'Sikkim Krantikari Morcha - SKM'
);

--Others
UPDATE partywise_results
SET party_alliance = 'OTHER'
WHERE party_alliance IS NULL;


--Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?
SELECT PR.party_alliance AS Alliance, SUM(PR.won) AS Total_Seats_Won FROM partywise_results AS PR
GROUP BY PR.party_alliance
ORDER BY Total_Seats_Won DESC;


--What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
   SELECT cd.Candidate,
    cd.Party,
    cd.EVM_Votes,
    cd.Postal_Votes,
    cd.Total_Votes,
    cr.Constituency_Name FROM constituencywise_details AS cd
	JOIN constituencywise_results as cr
	ON cd.Constituency_ID = cr.Constituency_ID
	WHERE constituency_name = 'GWALIOR'
	ORDER BY Total_Votes DESC
	;


	--Which parties won the most seats in specific state, and how many seats did each party win?
	SELECT PR.party, COUNT(CR.Parliament_Constituency) AS Seats_Won FROM partywise_results AS PR
	JOIN constituencywise_results AS CR 
	ON PR.party_id = CR.party_id
	JOIN statewise_results AS SR 
	ON CR.Parliament_Constituency = SR.Parliament_Constituency
	JOIN states AS S 
	ON SR.State_ID = S.State_ID
	WHERE S.state = 'Madhya Pradesh'
	GROUP BY PR.party;


	--Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?
	SELECT CR.winning_candidate, PR.party, CR.total_votes, CR.margin, S.state, CR.constituency_name
	FROM constituencywise_results AS CR
	JOIN partywise_results AS PR 
	ON CR.party_id = PR.party_id
	JOIN statewise_results AS SR
	ON CR.parliament_constituency = SR.parliament_constituency
	JOIN states AS S
	ON S.state_id = SR.state_id
	WHERE S.state = 'MADHYA PRADESH' AND constituency_name = 'GWALIOR'
	;


--What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024
SELECT 
    s.State AS State_Name,
    SUM(CASE WHEN p.party_alliance = 'NDA' THEN 1 ELSE 0 END) AS NDA_Seats_Won,
    SUM(CASE WHEN p.party_alliance = 'I.N.D.I.A' THEN 1 ELSE 0 END) AS INDIA_Seats_Won,
	SUM(CASE WHEN p.party_alliance = 'OTHER' THEN 1 ELSE 0 END) AS OTHER_Seats_Won
FROM constituencywise_results cr
JOIN  partywise_results p ON cr.Party_ID = p.Party_ID
JOIN  statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN  states s ON sr.State_ID = s.State_ID
WHERE  p.party_alliance IN ('NDA', 'I.N.D.I.A',  'OTHER')
GROUP BY s.State
ORDER BY s.State
;

--Which candidate received the highest number of EVM votes in each constituency (Top 10)?
SELECT TOP 10
    cr.Constituency_Name,
    cd.Constituency_ID,
    cd.Candidate,
    cd.EVM_Votes
FROM  constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE cd.EVM_Votes = (
        SELECT MAX(cd1.EVM_Votes)
        FROM constituencywise_details cd1
        WHERE cd1.Constituency_ID = cd.Constituency_ID
    )
ORDER BY 
    cd.EVM_Votes DESC;

