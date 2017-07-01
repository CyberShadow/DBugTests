struct Card {
    int value;
    int suit;
}

void foo(Card card) {
    switch(card.value) {
    case 4: case 5: case 6: case 11:
        break;
    default:
    }
}

void main() {
    auto card = Card(11, 1);
    foo(card);
} 
