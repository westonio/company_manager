# Company Manager 
This is a Ruby on Rails application that provides functionality to manage companies and their employees (a one-to-many relationship). It allows users to create new companies, add employees to those companies, and perform CRUD functionality related to company and employee data management.

### Built Using:

* Rails 7.0.5 and Ruby 3.2.2

* PosgreSQL DB

* pry, rspec-rails, and simplecov gems for testing


### Installation via command line:
1. Clone the repository: `git clone <repository-url>`
2. Navigate to the project directory: `cd company-management-app`
3. Install dependencies: `bundle install`
4. Set up the database: `rails db:setup`
5. Start the Rails server: `rails server`
6. Visit [http://localhost:3000](http://localhost:3000) in your web browser to access the application.

--------
## User Stories - Features
### Iteration 1

##### CRUD

```
[x] done
User Story 1, Company Index 

[x] done
User Story 2, Company Show 

[x] done
User Story 3, Employee Index 

[x] done
User Story 4, Employee Show 

[x] done
User Story 5, Company Employee Index 

[x] done
User Story 6, Company Index sorted by Most Recently Created 

[x] done
User Story 7, Company Employee Count
```

##### Usability

```
[x] done
User Story 8, Employee Index Link

[x] done
User Story 9, Company Index Link

[x] done
User Story 10, Company Employee Index Link
```

---

### Iteration 2

##### CRUD

```
[x] done
User Story 11, Company Creation 

[x] done
User Story 12, Company Update 

[x] done
User Story 13, Company Employee Creation 

[x] done
User Story 14, Employee Update 

[x] done
User Story 15, Employee Index only shows `true` Records 

[x] done
User Story 16, Sort Company's employees in Alphabetical Order by name 
```
##### Usability

```
[x] done
User Story 17, Company Update From Company Index Page 

[x] done
User Story 18, employee Update From employees Index Page 
```

---

### Iteration 3

##### CRUD

```
[x] done
User Story 19, Parent Delete 

[x] done
User Story 20, Child Delete 
```

##### ActiveRecord

```
[x] done
User Story 21, Display Records Over a Given Threshold 
```

##### Usability

```
[x] done
User Story 22, Parent Delete From Parent Index Page 

[x] done
User Story 23, Child Delete From Childs Index Page 
```
---