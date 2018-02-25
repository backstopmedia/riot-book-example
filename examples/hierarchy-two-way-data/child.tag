<child>
<p>{opts.name}</p>
  <h5>Favorite Foods</h5>
  <ul>
    <li each={opts.food_options} if={color == opts.favorite_color}>{name}</li>
  </ul>
  <div>
    <button click={doChore}>Do Chore</button>
    <button click={eatDinner}>Eat Dinner</button>
    <button click={complain}>Complain</button>
  </div>

  <style scoped>
    child {
      padding-top: 10px;
      border-bottom: 1px solid black;
    }

    child, child ul {
      margin-left: 15px;
    }
  </style>

  <script>

    doChore() {
      opts.handlers.chore(opts.name)
    }

    eatDinner() {
      opts.handlers.dinner(opts.name)
    }

    complain() {
      opts.handlers.complain(opts.name)
    }
  </script>
</child>
