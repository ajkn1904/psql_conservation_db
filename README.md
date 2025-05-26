# 🎯 Questions - Blog - Bangla
---
### 1. Explain the Primary Key and Foreign Key concepts in PostgreSQL. ***
✅*** Answer:*** `PostgreSQL`-এ `Primary Key` এবং `Foreign Key` কনসেপ্ট নিচে ব্যাখ্যা করা হলো:
- `Primary Key` (প্রাইমারি কী): `Primary Key` হলো এমন একটি কলাম বা কলামসমষ্টি যেটি একটি টেবিলের প্রতিটি রেকর্ডকে অন্য রেকর্ড থেকে আলাদা করে। এটি সবসময়  ইউনিক ভ্যালু হবে কিন্তু এবং নাল (NULL) হতে পারবে না। 

- `Foreign Key` (ফরেইন কী): `Foreign Key` হলো একটি টেবিলের এমন একটি কলাম যা অন্য টেবিলের `Primary Key`-এর সাথে সম্পর্ক স্থাপন করে। এটি মূলত রেফারেন্স করা টেবিলের এটি ডেটার সমন্বয় (data integrity) বজায় রাখে এবং দুইটি টেবিলের মধ্যে সম্পর্ক তৈরি করে।

***উদাহরণ:***
```sql
CREATE TABLE students (
    stu_id SERIAL PRIMARY KEY,
    name VARCHAR(50) not null,
    age INT not null,
    email VARCHAR(100) not null
);

CREATE TABLE enrollments (
    enrollment_id SERIAL PRIMARY KEY,
    stu_id INT REFERENCES students(stu_id)
);

```
এখানে,
* students টেবিলের stu_id হলো `Primary Key`. 
* enrollments টেবিলের enrollment_id হলো `Primary Key` এবং stu_id হলো `Foreign Key`, যা students টেবিলের `Primary Key`-কে নির্দেশ করে।


---

### 2. What is the difference between the `VARCHAR` and `CHAR` data types?
✅*** Answer:*** `VARCHAR` এবং `CHAR` ডেটা টাইপ  ডেটাবেইসে টেক্সট ডেটা সংরক্ষণের জন্য ব্যবহৃত হয়। `Varchar` এবং `Char`  এর মধ্যে প্রধান পার্থক্য নিচে দেওয়া হলো:
* CHAR(n): একটি ফিক্সড-লেন্থ ডেটা টাইপ, অর্থাৎ এটি সবসময় নির্দিষ্ট (n) সংখ্যক ক্যারেক্টার সংরক্ষণ করে। যদি কম ক্যারেক্টার যুক্ত স্ট্রিং দেওয়া হয়, তখন অতিরিক্ত জায়গা ফাঁকা (padding) দিয়ে পূরণ করে।
* VARCHAR(n): একটি ভ্যারিয়েবল-লেন্থ ডেটা টাইপ, অর্থাৎ এটি শুধুমাত্র ততটুকুই জায়গা নেয় ক্যারেক্টার/স্টিং লেন্থ যতটুকু হবে। এটি সর্বোচ্চ n লেন্থের ডেটা সংরক্ষণ করতে পারে।

***উদাহরণ:***
`CHAR(10) → 'abc'`    → সংরক্ষণ করবে 'abc       '।  
`VARCHAR(10) → 'abc'` → সংরক্ষণ করবে শুধুমাত্র 'abc'।


---

### 3. Explain the purpose of the `WHERE` clause in a `SELECT` statement.
✅*** Answer:*** `WHERE` clause ডেটাবেইস থেকে নির্দিষ্ট শর্তের উপর ভিত্তি করে ডেটা ফিল্টার করতে ব্যবহৃত হয়। `Where` clasue একটি টেবিলের কোন কোন সারি সিলেক্ট করা হবে সেটি নির্ধারণ করে।

***উদাহরণ:***
```sql
SELECT * FROM students WHERE age > 18;
```
এটি শুধুমাত্র সেই ছাত্রদের ডেটা দেখাবে যাদের বয়স ১৮ এর বেশি।

---

### 4. What are the `LIMIT` and `OFFSET` clauses used for?
✅*** Answer:*** `LIMIT` এবং `OFFSET` সাধারণত পেইজিনেশন বা নির্দিষ্ট সংখ্যক ডেটা দেখাতে ব্যবহৃত হয়। `LIMIT` নির্ধারণ করে কতটি রেকর্ড রিট্রাইভ করে দেখানো হবে। আর `OFFSET` নির্ধারণ করে শুরু থেকে কতটি রেকর্ড বাদ দেওয়া হবে।

***উদাহরণ:***
```sql
SELECT * FROM students LIMIT 5 OFFSET 10;
```
এই স্টেটমেন্ট প্রথম ১০ টি রেকর্ড বাদ দিয়ে পরবর্তী ৫ টি রেকর্ড দেখাবে।


---


### 5. How can you calculate aggregate functions like `COUNT()`, `SUM()`, and `AVG()` in PostgreSQL?
✅*** Answer:*** অ্যাগ্রিগেট ফাংশানগুলো একটি কলামের উপর বিভিন্ন রকম গাণিতিক হিসাবের জন্য ব্যবহৃত হয়।
যেমন:
* `COUNT()`: মোট রেকর্ড সংখ্যা গণনা করে,
* `SUM()`: যোগফল নির্ণয় করে,
* `AVG()`: গড় মান নির্ণয় করে।

***উদাহরণ:***
```sql
SELECT COUNT(*) FROM students; -- মোট কতজন শিক্ষার্থী আছে তা গণনা করে। 
SELECT SUM(age) FROM students; -- সব শিক্ষার্থীর বয়সের যোগফল দেয়।
SELECT AVG(age) FROM students; -- শিক্ষার্থীদের গড় বয়স নির্ণয় করে।
```