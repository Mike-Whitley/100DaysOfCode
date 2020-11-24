"""Mike w
rock paper scissors using a class basic implementation using if else checks"""

import random


class RockPaperScissors():
    """class  """
    
    def __init__(self):
        self.name = ""
        self.RPS_Me = ""
        self.RPS_Comp = ""
        self.compwins = 0
        self.playerwins = 0
        self.yes_or_no = ''
        
    def newgame(self, game1):
        """sets up a new game and asks initially if the player knows how to play """
        self.name = input('Welcome to Rock, Paper, Scissors. First enter your name. ')
        instructions_prompt = '\nWelcome {} do you understand the rules of Rock, Paper Scissors? y/n? '
        self.yes_or_no = input(instructions_prompt.format(self.name))
        
        if self.yes_or_no == 'y':
            game1.start_game(game1)
        else:       
            game1.instructions(game1)
            
    def player_pick(self):
        """Determines the input of the player either r,p or s and stores it in RPS_Me """
        self.RPS_Me = input('\nPlease pick R, P, or S: ')
        while self.RPS_Me not in ['r','p','s','R','P','S']:
            self.RPS_Me = input('\nInvalid input please pick R, P, or S: ')        
            
    def instructions(self, game1):
        """Prints the games instructions and then begins the game """
        print('\nTo win the game you need to play the option that beats the computers choice rock beats scissors, scissors beats paper and paper beats rock. For this game you only need to enter P for paper, S for scissors and R for rock.')
        self.yes_or_no = 'y'
        game1.start_game(game1)
        
    def computer_pick(self):
        """uses random numb generated between 1 - 3 assigned 1=R 2=P 3=S and 
        assigns that value to RPS_Comp"""
        rannum = random.randint(1,3)
        if rannum == 1:
            self.RPS_Comp = 'r'
        elif rannum == 2:
            self.RPS_Comp = 'p'
        else:
            self.RPS_Comp = 's'
        
        
        
    def comparison(self, game1):
        """comapres RPS_Me and RPS_Comp to see if its a win draw or tie
        and who has one. updates the score """
        if self.RPS_Comp == self.RPS_Me:
            print('\ndraw! New game')
            print('\nPoints PC:{}, Player:{}'.format(self.compwins, self.playerwins))
            game1.start_game(game1)
        else:
            if self.RPS_Me == 'p' or 'P':
                if self.RPS_Comp == 'r':
                    self.compwins = self.compwins + 1
                    print('Comp Wins')
                    game1.display_restart(game1)
                else:
                    self.playerwins = self.playerwins + 1
                    print('you Win')
                    game1.display_restart(game1)                    
            
            elif self.RPS_Me == 'r' or 'R':
                if self.RPS_Comp == 's':
                    self.compwins = self.compwins + 1
                    print('Comp Wins')
                    game1.display_restart(game1)                 
                else:
                    self.playerwins = self.playerwins + 1
                    print('you Win')
                    game1.display_restart(game1)              
                
                
            elif self.RPS_Me == 's' or "S":
                if self.RPS_Comp == 'p':
                    self.compwins = self.compwins + 1
                    print('Comp Wins')
                    game1.display_restart(game1)
                else:
                    self.playerwins = self.playerwins + 1
                    print('you Win')
                    game1.display_restart(game1)
                    
    def display_restart(self, game1):
        """helper function for comparison prints the current points and restarts the game """
        print('\nPoints PC:{}, Player:{}'.format(self.compwins, self.playerwins))
        game1.start_game(game1)  
    
        
    def start_game(self, game1):
        """Starts the game """
        game1.player_pick()
        game1.computer_pick()
        game1.comparison(game1)
    
def main():
    """main function sets up the game class and calls the first game. """
    game1 = RockPaperScissors()
    game1.newgame(game1)
    
main()
