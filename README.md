# 🎤❤️ Singalike

A simple web app for picking which song to sing along to next, e.g. when sitting around a
campfire with a guitar.

## How it works

An admin adds songs to the app, including their lyrics and chords. Everyone else just opens the
app on their phone (no account needed) and votes ❤️ for the songs they'd like to sing. The song
list shows what's currently playing 🎤, which songs are next up (sorted by vote count), and the
full songbook to vote on.

The player (e.g. the person with the guitar 🎸) signs in, picks the next song from the top-voted
ones, and marks it as currently playing. Everyone can then follow along with the lyrics and
chords 🎶 on their own phone.

The page updates live for everyone as votes come in and the currently playing song changes, so
there's no need to refresh 🔄. Every one has a great time! 🔥

## Tech stack

Built with Ruby on Rails, using Hotwire (Turbo + Stimulus) for the live, no-refresh updates and
Tailwind CSS for styling. Data is stored in SQLite.
