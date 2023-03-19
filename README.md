# Table of Contents
1. [Tech-stack](#tech-stack)
2. [Development](#development)

---
### Tech-stack
1. [Ruby 3.2.0](https://www.ruby-lang.org/en/news/2022/12/25/ruby-3-2-0-released/)
2. [Rails 7.0.4](https://rubygems.org/gems/rails/versions/7.0.4)
3. [RSpec](https://rspec.info/)
4. [Rubocop](https://rubocop.org/)
5. [CI: GitHub Actions](https://docs.github.com/en/actions)
    - Checks build passes
    - Run all tests
    - Code formatting check 
    - Code coverage check 

---
### Development:
#### 1. Build project 
```shell
bundle install
```

#### 2. Run all tests
```shell
bundle exec rspec
```

#### 3. Format
```shell
bundle exec rubocop -a
```

#### 4. Verify formatting
```shell
bundle exec rubocop
```
