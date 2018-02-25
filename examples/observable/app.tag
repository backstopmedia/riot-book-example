<app>
    <header api={opts.api}></header>
    <usernameform api={opts.api}></usernameform>

    <button click={opts.api.logout}>Log Out</button>
    <button click={resetUsername}>Reset Username</button>

    <script>
        resetUsername() {
            opts.api.changeUsername('riotfan')
        }
    </script>
</app>
