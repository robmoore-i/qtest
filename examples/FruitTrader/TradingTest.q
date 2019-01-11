\l ../../qtest.q
\l ../../assertq.q

\l FruitTrader.q
\l Market.q

.qtest.test["A bought orange moves from the Market to the Trader's inventory";{
    trader:.fruitTrader.new[];
    market:.market.new[`orange`apples!1 2;`oranges`apples!15 10];
    .fruitTrader.buy[trader;market;`orange];
    all (.assert.equal[0;.market.quantity[market;`oranges]];
         .assert.equal[1;.fruitTrader.inventory[trader;`oranges]])}]

exit .qtest.report[]