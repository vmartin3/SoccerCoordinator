import UIKit
import Foundation

//This is where all the data on each player is stored
let JoeSmith = ["Name":"Joe Smith","Height":42,"Experience":true,"Parents":"Jim and Jan Smith"]
let JillTanner = ["Name":"Jill Tanner","Height":36,"Experience":true,"Parents":"Clara Tanner"]
let BillBon = ["Name":"Bill Bon","Height":43,"Experience":true,"Parents":"Sara and Jenny Bon"]
let EvaGordon = ["Name":"Eva Gordon","Height":45,"Experience":false,"Parents":"Wendy and Mike Gordon"]
let MattGill = ["Name":"Matt Gill","Height":40,"Experience":false,"Parents":"Charles and Sylvia Gill"]
let KimmyStein = ["Name":"Kimmy Stein","Height":41,"Experience":false,"Parents":"Bill and Hillary Stein"]
let SammyAdams = ["Name":"Sammy Adams","Height":45,"Experience":false,"Parents":"Jeff Adams"]
let KarlSaygan = ["Name":"Karl Saygan","Height":42,"Experience":true,"Parents":"Heather Bledsoe"]
let SuzaneGreenberg = ["Name":"Suzane Greenberg","Height":44,"Experience":true,"Parents":"Henrietta Dumas"]
let SalDali = ["Name":"Sal Dali","Height":41,"Experience":false,"Parents":"Gala Dali"]
let JoeKavlier = ["Name":"Joe Kavlier","Height":39,"Experience":false,"Parents":"Sam and Elaine Kavalier"]
let BenFinkelstein = ["Name":"Ben Finkelstein","Height":44,"Experience":false,"Parents":"Aaron and Jill Finkelstein"]
let DiegoSoto = ["Name":"Diego Soto","Height":41,"Experience":true,"Parents":"Robin and Sarika Soto"]
let ChloeAlaska = ["Name":"Chloe Alaska","Height":47,"Experience":false,"Parents":"David and Jamie Alaska"]
let ArnoldWillis = ["Name":"Arnold Willis","Height":43,"Experience":false,"Parents":"Claire Willis"]
let PhillipHelm = ["Name":"Phillip Helm","Height":44,"Experience":true,"Parents":"Thomas Helm and Eva Jones"]
let LesClay = ["Name":"Les Clay","Height":42,"Experience":true,"Parents":"Wynonna Brown"]
let HerschelKrustofski = ["Name":"Herchsel Krustofski","Height":45,"Experience":true,"Parents":"Hyman and Rachel Krustofski"]

//This is holds the data on all players in one collection
let allPlayers = [JoeSmith,JillTanner,BillBon,EvaGordon,MattGill,KimmyStein,SammyAdams,KarlSaygan,SuzaneGreenberg,SalDali,JoeKavlier,BenFinkelstein,DiegoSoto,ChloeAlaska,ArnoldWillis,PhillipHelm,LesClay,HerschelKrustofski]

//These will hold all the team player information specific to their teams
var dragons: [[String:NSObject]] = []
var sharks: [[String:NSObject]] = []
var raptors: [[String:NSObject]] = []

//Variables used to calculate an even team distriubtion based experience
var experiencedCounter = 0
var nonExperiencedCounter = 0
var numOfTeams = 3
var evenDistribution: Bool = false

//Function that takes in one parameter: Team data. And will evenly distribute the players based on their experience level to make even teams
func divideTeamsEqually (teamData team:[[String:NSObject]])
{
    for player in team
    {
        if player["Experience"] == true{
            experiencedCounter += 1
            //This switch statement switches on the experiencedCounter so that an experienced player is added to one team at a time until there are no more experienced players
            switch (experiencedCounter){
            case 1: dragons.append(player)
            case 2: sharks.append(player)
            case 3: raptors.append(player)
            default:print("Error")
            }
        }
        else if player["Experience"] == false{
            nonExperiencedCounter += 1
            switch (nonExperiencedCounter){
            case 1: dragons.append(player)
            case 2: sharks.append(player)
            case 3: raptors.append(player)
            default:print("Error")
            }
            
            //Once the counter hits the number of teams there are it needs to be reset so that it can go back to the top and add players to the first teams aagain and then so on and so forth until it reaches the last team and will be reset again
            if experiencedCounter == numOfTeams{
                evenDistribution = true
                if evenDistribution{
                    experiencedCounter = resetCounter(counterType: experiencedCounter)
                }
                evenDistribution = false
            }
            else if nonExperiencedCounter == numOfTeams{
                evenDistribution = true
                if evenDistribution{
                    nonExperiencedCounter = resetCounter(counterType: nonExperiencedCounter)
                }
                evenDistribution = false
            }
        }
    }
}

//Function that simply resets the counter everytime all teams have been given a new player
func resetCounter(var counterType counter:Int) -> Int
{
    counter = 0
    return counter
}

//Function accepts team details and team name and sends a letter to appropriate parents letting them know their child's practice schedule
func sendLetter(teamDetails teamName:[[String:NSObject]], teamNameText: String)
{
    for player in teamName{
        switch(teamNameText){
            case "Sharks":print("Dear \(player["Parents"]!), \n Congratulations your child, \(player["Name"]!) has been placed on the \(teamNameText). We are so excited to have them on the team. See below for the practice schedule specific to their team: \n  Sharks - March 17, 3pm\nPlease reach out to the coach with any questions. Best of luck this season! \n\n Best, \n Soccer Administration \n--")
            case "Dragons": print("Dear \(player["Parents"]!), \n Congratulations your child, \(player["Name"]!) has been placed on the \(teamNameText). We are so excited to have them on the team. See below for the practice schedule specific to their team: \n  Dragons - March 17, 1pm\nPlease reach out to the coach with any questions. Best of luck this season! \n\n Best, \n Soccer Administration \n--")
            case "Raptors": print("Dear \(player["Parents"]!), \n Congratulations your child, \(player["Name"]!) has been placed on the \(teamNameText). We are so excited to have them on the team. See below for the practice schedule specific to their team: \n  Raptors - March 18, 1pm\nPlease reach out to the coach with any questions. Best of luck this season! \n\n Best, \n Soccer Administration \n--")
        default: "No Team of This Name Found"
    }
}
}

//Prints a divider between team letters
func printDivider()
{
    print("//////////////////////////////////////////// \n NEXT TEAM \n //////////////////////////////////////////// \n NEXT TEAM\n //////////////////////////////////////////// \n")
}

//This is where all the code is executed
divideTeamsEqually(teamData: allPlayers)
sendLetter(teamDetails: sharks,teamNameText:"Sharks")
printDivider()
sendLetter(teamDetails: dragons,teamNameText:"Dragons")
printDivider()
sendLetter(teamDetails: raptors,teamNameText:"Raptors")


