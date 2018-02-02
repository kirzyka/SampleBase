# Mini-project #6 - Blackjack

import simpleguitk as simplegui
import random

# load card sprite - 949x392 - source: jfitz.com
CARD_SIZE = (73, 98)
CARD_CENTER = (36.5, 49)
card_images = simplegui.load_image("http://commondatastorage.googleapis.com/codeskulptor-assets/cards.jfitz.png")

CARD_BACK_SIZE = (71, 96)
CARD_BACK_CENTER = (35.5, 48)
card_back = simplegui.load_image("http://commondatastorage.googleapis.com/codeskulptor-assets/card_back.png")    

# initialize some useful global variables
in_play = False
outcome = ""
msg = ""
score = 0

# define globals for cards
SUITS = ('C', 'S', 'H', 'D')
RANKS = ('A', '2', '3', '4', '5', '6', '7', '8', '9', 'T', 'J', 'Q', 'K')
VALUES = {'A':1, '2':2, '3':3, '4':4, '5':5, '6':6, '7':7, '8':8, '9':9, 'T':10, 'J':10, 'Q':10, 'K':10}

MSG_RESULT_WIN = "You win."
MSG_RESULT_LOSE = "You lose."
MSG_RESULT_BUSTED = "You went bust and lose."
MSG_RESULT_EQUAL = "Dead heat."

MSG_PROMPT_NEW_DEAL = "New deal?"
MSG_PROMPT_HIT_STND = "Hit or stand?"

# define card class
class Card:
    def __init__(self, suit, rank):
        if (suit in SUITS) and (rank in RANKS):
            self.suit = suit
            self.rank = rank
        else:
            self.suit = None
            self.rank = None
            print "Invalid card: ", suit, rank

    def __str__(self):
        return self.suit + self.rank

    def get_suit(self):
        return self.suit

    def get_rank(self):
        return self.rank
    
    def get_value(self):
        return VALUES[self.rank]
    
    def draw(self, canvas, pos):
        card_loc = (CARD_CENTER[0] + CARD_SIZE[0] * RANKS.index(self.rank), 
                    CARD_CENTER[1] + CARD_SIZE[1] * SUITS.index(self.suit))
        canvas.draw_image(card_images, card_loc, CARD_SIZE, [pos[0] + CARD_CENTER[0], pos[1] + CARD_CENTER[1]], CARD_SIZE)
        
# define hand class
class Hand:
    def __init__(self):
        self.cards = []

    def __str__(self):
        return str(self.cards)

    def add_card(self, card):
        self.cards.append(card)

    def get_value(self):
        # count aces as 1, if the hand has an ace, then add 10 to hand value if it doesn't bust
        value = 0
        has_ace = False
        for card in self.cards:
            value += card.get_value()
            if card.get_rank() == 'A':
                has_ace = True    
        
        if has_ace and value + 10 <= 21:
            value += 10
        
        return value
   
    def draw(self, canvas, pos, whole):
        if whole:
            pos[0] -= CARD_SIZE[0]
            for i in range(len(self.cards)): 
                pos[0] += CARD_SIZE[0]
                self.cards[i].draw(canvas, pos)
                pos[0] += 10
        else:
            card_loc = (CARD_BACK_CENTER[0], CARD_BACK_CENTER[1])
            canvas.draw_image(card_back, 
                              card_loc, CARD_BACK_SIZE, 
                              [pos[0] + CARD_BACK_CENTER[0], pos[1] + CARD_BACK_CENTER[1]], CARD_BACK_SIZE)
            pos[0] += CARD_SIZE[0] + 10
            self.cards[0].draw(canvas, pos)
                
        
# define deck class 
class Deck:
    def __init__(self):
        self.cards = []

    def shuffle(self):
        self.cards = []
        # shuffle the deck 
        for s in SUITS:
            for r in RANKS:
                card = Card(s, r)
                self.cards.append(card)        
        random.shuffle(self.cards)

    def deal_card(self):
        return self.cards.pop()
    
    def draw(self, canvas, pos):
        card_loc = (CARD_BACK_CENTER[0], CARD_BACK_CENTER[1])
        canvas.draw_image(card_back, 
                          card_loc, CARD_BACK_SIZE, 
                          [pos[0] + CARD_BACK_CENTER[0], pos[1] + CARD_BACK_CENTER[1]], CARD_BACK_SIZE)
        
    def __str__(self):
        return str(self.cards)
   
deck = Deck()    
dealer = Hand()
player = Hand()

#define event handlers for buttons
def deal():
    global outcome, msg, in_play
    global deck, dealer, player
    deck = Deck() 
    deck.shuffle()
    
    player = Hand()
    player.add_card(deck.deal_card())
    dealer = Hand()
    dealer.add_card(deck.deal_card())
    
    player.add_card(deck.deal_card())

    in_play = True
    outcome = ""
    msg = MSG_PROMPT_HIT_STND

def hit():
    global outcome, msg, in_play, score
    global deck, player
    
    # if the hand is in play, hit the player
    if in_play:
        player.add_card(deck.deal_card())    
        # if busted, assign a message to outcome, update in_play and score
        if player.get_value() > 21:
            in_play = False
            outcome = MSG_RESULT_BUSTED
            msg = MSG_PROMPT_NEW_DEAL
            dealer.add_card(deck.deal_card())
            score += dealer.get_value() - 22
        
def stand():    
    global outcome, msg, in_play, score
    if in_play:
        # if hand is in play, repeatedly hit dealer until his hand has value 17 or more
        dealer.add_card(deck.deal_card())
        while dealer.get_value() < 17:
            dealer.add_card(deck.deal_card())
            
        # assign a message to outcome, update in_play and score
        in_play = False
        if dealer.get_value() < player.get_value():
            outcome = MSG_RESULT_WIN
            score += player.get_value() - dealer.get_value()
        elif dealer.get_value() > 21:
            outcome = MSG_RESULT_WIN
            score += 22 - player.get_value()      
        elif dealer.get_value() == player.get_value():
            outcome = MSG_RESULT_EQUAL
        else:
            outcome = MSG_RESULT_LOSE
            score += player.get_value() - dealer.get_value()
                
        msg = MSG_PROMPT_NEW_DEAL

# draw handler    
def draw(canvas):    
    canvas.draw_text('BlackJack', [50, 50], 30, 'White')
    canvas.draw_text('Score: ' + str(score), [250, 50], 20, 'Black')
        
    deck.draw(canvas, [10, 100])
    deck.draw(canvas, [12, 98])
    deck.draw(canvas, [14, 96])
    
    canvas.draw_text('Dealer', [100, 200], 20, 'Black')
    canvas.draw_text(outcome, [250, 200], 20, 'Black')
    dealer.draw(canvas, [100, 210], not in_play)
    
    canvas.draw_text('Player', [100, 350], 20, 'Black')
    canvas.draw_text(msg, [250, 350], 20, 'Black')
    player.draw(canvas, [100, 360], True)

# initialization frame
frame = simplegui.create_frame("Blackjack", 600, 600)
frame.set_canvas_background("Green")

#create buttons and canvas callback
frame.add_button("Deal", deal, 200)
frame.add_button("Hit",  hit, 200)
frame.add_button("Stand", stand, 200)
frame.set_draw_handler(draw)

# get things rolling
deal()
frame.start()