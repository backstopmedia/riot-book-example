<parent>
  <h4>Parent Tag</h4>
  <p>Favorite Child: {favoriteChildName}</p>
  <child
    each={opts.children}
    name={name}
    favorite_color={favorite_color}
    food_options={parent.opts.food_options}
    handlers={handlers}>
  </child>

  <script>
    var childScores = {}

    // track our favorite child
    this.favoriteChildName = calculateFavorite()

    // create handler functions for the children to call upon each action
    this.handlers = {
      chore: function childCompletedChore(childName) {
        changeScore(childName, 1)
      },
      dinner: function childAteDinner(childName) {
        changeScore(childName, 1)
      },
      complain: function childComplained(childName) {
        changeScore(childName, -1)
      }
    };

    // adjust our 'score' for each child - can be positive or negative
    var changeScore = function changeScore(name, scoreChange) {
      if (childScores[name] == undefined) {
        childScores[name] = 0
      }
      childScores[name] += scoreChange

      // set the favorite child and re-render
      this.favoriteChildName = calculateFavorite()
      this.update()
    }.bind(this)

    // return the favorite child name based on score
    // ties are broken alphabetically where later letters 'win'
    function calculateFavorite() {
      var childNames = Object.keys(childScores)
      var favoriteScore = -999
      var favoriteChildName = 'None'
      for (var i = 0; i < childNames.length; i++) {
        var childName = childNames[i]
        var childScore = childScores[childName]
        if (childScore > favoriteScore) {
          favoriteChildName = childName
          favoriteScore = childScore
        } else if (
            childScore === favoriteScore &&
            childName > favoriteChildName) {
          favoriteChildName = childName
        }
      }

      return favoriteChildName
    }

  </script>
</parent>
