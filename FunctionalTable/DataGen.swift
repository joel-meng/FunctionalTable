//
//  DataGen.swift
//  TableViewPlay
//
//  Created by Joel Meng on 6/27/19.
//  Copyright © 2019 Joel Meng. All rights reserved.
//

import Foundation

func cities() -> [City] {
    return [
        City(name: "Sydney", country: "Australia", lat: -33.865143, long: 151.2099, shortDescription: """
        Sydney is the state capital of New South Wales and the most populous city in Australia and Oceania. Located on Australia's east coast, the metropolis surrounds Port Jackson and extends about 70 km (43.5 mi) on its periphery towards the Blue Mountains to the west, Hawkesbury to the north, the Royal National Park to the south and Macarthur to the south-west.[9] Sydney is made up of 658 suburbs, 40 local government areas and 15 contiguous regions. Residents of the city are known as "Sydneysiders". As of June 2017, Sydney's estimated metropolitan population was 5,230,330 and is home to approximately 65% of the state's population.
        """),
        City(name: "Melbourne", country: "Australia", lat: -37.815018, long: 144.946014, shortDescription: """
        Melbourne is the capital and most populous city of the Australian state of Victoria, and the second most populous city in Australia and Oceania. Its name refers to an urban agglomeration of 9,992.5 km2 (3,858.1 sq mi), comprising a metropolitan area with 31 municipalities, and is also the common name for its city centre. The city occupies much of the coastline of Port Phillip bay and spreads into the hinterlands towards the Dandenong and Macedon ranges, Mornington Peninsula and Yarra Valley. It has a population of approximately 5 million (19% of the population of Australia), and its inhabitants are referred to as "Melburnians".
        """),
        City(name: "Brisbane", country: "Australia", lat: -27.470125, long: 153.021072, shortDescription: """
        Brisbane is the capital of and the most populated city in the Australian state of Queensland,[9] and the third most populous city in Australia. Brisbane's metropolitan area has an estimated population of 2.56 million as of June 2019,  and the South East Queensland metropolitan region, centred on Brisbane, encompasses a population of more than 3.6 million.
        """),
        City(name: "Hobart", country: "Australia", lat: -41.640079, long: 146.315918, shortDescription: """
        Hobart is the capital and most populous city of the Australian island state of Tasmania. With a population of approximately 225,000 (over 40% of Tasmania's population), it is the least populated Australian state capital city, and second smallest if territories are taken into account (after Darwin, Northern Territory).[1] Founded in 1804 as a British penal colony,[6] Hobart, formerly known as Hobart Town or Hobarton, is Australia's second oldest capital city after Sydney, New South Wales. Prior to British settlement, the Hobart area had been occupied for possibly as long as 35,000 years,[7] by the semi-nomadic Mouheneener tribe, a sub-group of the Nuennone, or South-East tribe.[8] The descendants of these Aboriginal Tasmanians often refer to themselves as 'Palawa'.
        """),
        City(name: "Adelaide", country: "Australia", lat: -34.92866, long: 138.59863, shortDescription: """
        Adelaide is the capital city of the state of South Australia, and the fifth-most populous city of Australia. Adelaide is home to 77 percent of the South Australian population, making it the most centralised population of any state in Australia.
        """),
        City(name: "Perth", country: "Australia", lat: -31.95224, long: 115.8614, shortDescription: """
        Perth is the capital and largest city of the Australian state of Western Australia (WA). It is named after the city of Perth, Scotland and is the fourth-most populous city in Australia, with a population of 2.06 million living in Greater Perth.[1] Perth is part of the South West Land Division of Western Australia, with the majority of the metropolitan area located on the Swan Coastal Plain, a narrow strip between the Indian Ocean and the Darling Scarp. The first areas settled were on the Swan River at Guildford, with the city's central business district and port (Fremantle) both later founded downriver.
        """),
        City(name: "Darwin", country: "Australia", lat: -12.46113, long: 130.84185, shortDescription: """
        Darwin is the capital city of the Northern Territory of Australia, situated on the Timor Sea. It is the largest city in the sparsely populated Northern Territory, with a population of 145,916.[1] It is the smallest, wettest and most northerly of the Australian capital cities, and acts as the Top End's regional centre.
        """),
        City(name: "Canberra", country: "Australia", lat: -35.28346, long: 149.12807, shortDescription: """
        Canberra is the capital city of Australia. Founded following the federation of the colonies of Australia as the seat of government for the new nation, it is Australia's largest inland city and the eighth-largest city overall. The city is located at the northern end of the Australian Capital Territory; 280 km (170 mi) south-west of Sydney and 660 km (410 mi) north-east of Melbourne.
        """),
        City(name: "New York",country: "United States",lat: 40.71427,long: -74.00597, shortDescription: """
        The City of New York, usually called either New York City (NYC) or simply New York (NY), is the most populous city in the United States.[11] With an estimated 2018 population of 8,398,748[7] distributed over a land area of about 302.6 square miles (784 km2), New York is also the most densely populated major city in the United States. Located at the southern tip of the state of New York, the city is the center of the New York metropolitan area, the largest metropolitan area in the world by urban landmass and one of the world's most populous megacities, with an estimated 19,979,477 people in its 2018 Metropolitan Statistical Area and 22,679,948 residents in its Combined Statistical Area.[4][5] A global power city,[18] New York City has been described as the cultural,[19][20][21][22][23] financial,[24][25] and media capital of the world,[26][27] and exerts a significant impact upon commerce,[25] entertainment, research, technology, education, politics, tourism, art, fashion, and sports. The city's fast pace[28][29][30] has inspired the term New York minute.[31] Home to the headquarters of the United Nations,[32] New York is an important center for international diplomacy.[33][34]
        """),
        City(name: "London",country: "England",lat: 51.51279,long: -0.09184, shortDescription: ""),
        City(name: "Amsterdam",country: "Netherlands",lat: 52.37403,long: 4.88969, shortDescription: ""),
        City(name: "Tokyo", country: "Japan", lat: 35.6850, long: 139.7514, shortDescription: ""),
    ]
}

func moreCities() -> [City] {
    return [
        City(name: "Seattle",country: "United States",lat: 47.60621,long: -122.33207, shortDescription: ""),
        City(name: "San Francisco", country: "United States", lat: 37.773972, long: -122.431297, shortDescription: """
        San Francisco officially the City and County of San Francisco, is a city in, and the cultural, commercial, and financial center of, Northern California. San Francisco is the 13th-most populous city in the United States, and the fourth-most populous in California, with 883,305 residents as of 2018.[14] It covers an area of about 46.89 square miles (121.4 km2),[19] mostly at the north end of the San Francisco Peninsula in the San Francisco Bay Area, making it the second-most densely populated large U.S. city, and the fifth-most densely populated U.S. county, behind only four of the five New York City boroughs. San Francisco is the 12th-largest metropolitan statistical area in the United States, with 4,729,484 people in 2018. With San Jose, it forms the fifth most populous combined statistical area in the United States, the San Jose–San Francisco–Oakland, CA Combined Statistical Area (9.67 million residents in 2018).
        """),
        City(name: "Mexico City", country: "Mexico", lat: 19.4424, long: -99.1310, shortDescription: ""),
        City(name: "Mumbai", country: "India", lat: 19.0170, long: 72.8570, shortDescription: ""),
        City(name: "Sao Paulo", country: "Brazil", lat: -23.5587, long: -46.6250, shortDescription: "")
    ]
}
