<stats>
  <!-- display all the words we were given -->
  <h3>{opts.words.join(' ')}</h3>

  <!-- show each piece of info collected below -->
  <div each={info}>
    <label>{title}:</label>
    <span>{stat}</span>
  </div>

  <script>
    // we can use regular javascript in our tag logic
    var vowels = ['a','e','i','o','u']

    // wait until the tag mounts so we can get the opts
    this.on('mount', function() {
      var letterCount = 0
      var vowelCount = 0
      var wordCount = 0

      // process each word
      for (var i = 0, n = opts.words.length; i < n; i++) {
        wordCount++
        var wordStats = analyzeWord(opts.words[i])
        vowelCount += wordStats.vowelCount
        letterCount += wordStats.length
      }

      // create a list of statistics to show on the page
      this.info = [
        {title: 'Words', stat: wordCount},
        {title: 'Vowels', stat: vowelCount},
        {title: 'Letters', stat: letterCount}
      ]

      // if includeY is given in the opts, count it as a vowel
      if (opts.includeY) {
        vowels.push('y')
      }

      // update so riot knows it should re-render with our new changes
      this.update()
    }.bind(this))

    // return the number of vowels and the total number of letters
    function analyzeWord(word) {
      var vowelCount = 0
      for (var i = 0, n = word.length; i < n; i++) {
        if (vowels.indexOf(word[i]) !== -1) {
          vowelCount++
        }
      }
      return {
        length: word.length,
        vowelCount: vowelCount
      }
    }
  </script>
</stats>
