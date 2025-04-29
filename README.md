# Sinatra Hello World API 🌍❤️

A super simple Ruby Sinatra API that returns a plain text string.

---

## ▶️ Getting Started

### 🔧 Prerequisites

- Ruby (>= 2.5)
- Bundler (optional, but recommended)

### 📦 Install dependencies

If using Bundler:

```bash
bundle init
echo 'gem "sinatra"' >> Gemfile
bundle install
```

Or just install Sinatra directly:

```bash
gem install sinatra
```

---

## ▶️ Run the API

Create a file named `app.rb` with the following content:

```ruby
require 'sinatra'

get '/str' do
  "hello world from ruby with love"
end
```

Then run:

```bash
ruby main.rb
```

By default, the server runs at: [http://localhost:4567](http://localhost:4567)

---

## 📘 API Reference

### GET `/str`

- **Returns:** Plain text greeting
- **Content-Type:** `text/html` (default)
- **Response Body:**

```
hello world from ruby with love
```

---

## 🧪 Example (with curl)

```bash
curl http://localhost:4567
```

---

## 🧰 Tech Stack

- Ruby
- Sinatra

---

## 📄 License

MIT — free to use, modify, and share.