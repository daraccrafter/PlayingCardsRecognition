cards = {'2 of clubs', '2 of diamonds', '2 of hearts', '2 of spades', '3 of clubs', '3 of diamonds', '3 of hearts', '3 of spades','4 of clubs', '4 of diamonds', '4 of hearts', '4 of spades',...
         '5 of clubs', '5 of diamonds', '5 of hearts', '5 of spades','6 of clubs', '6 of diamonds', '6 of hearts', '6 of spades','7 of clubs', '7 of diamonds', '7 of hearts', '7 of spades',...
         '8 of clubs', '8 of diamonds', '8 of hearts', '8 of spades','9 of clubs', '9 of diamonds', '9 of hearts', '9 of spades','10 of clubs', '10 of diamonds', '10 of hearts', '10 of spades',...
         'ace of clubs', 'ace of diamonds', 'ace of hearts', 'ace of spades','joker of clubs', 'joker of diamonds', 'joker of hearts', 'joker of spades','king of clubs', 'king of diamonds', 'king of hearts', 'king of spades',...
         'queen of clubs', 'queen of diamonds', 'queen of hearts', 'queen of spades',};
mkdir("Dataset");
for i=1:length(cards)
    mkdir("Dataset",""+cards(1,i))
end