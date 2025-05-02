/* 
Creating tables and checking if any problems occured.
*/
CREATE TABLE Books (
	Book_ID INT PRIMARY KEY,
    Title VARCHAR(255),
    Author VARCHAR(255),
    Genre VARCHAR(100),
    ISBN VARCHAR(20),
    Copies_Available INT
);

CREATE TABLE Students (
	Student_ID INT PRIMARY KEY,
    `Name` VARCHAR(255),
    Email VARCHAR(255),
    Major VARCHAR(100)
);

CREATE TABLE Librarians (
	Librarian_ID INT PRIMARY KEY,
    `Name` VARCHAR(255),
    Email VARCHAR(255)
);

CREATE TABLE Borrowing (
	Borrow_ID INT PRIMARY KEY,
    Book_ID INT,
    Student_ID INT,
    Borrow_Date DATE,
    Return_Date DATE,
    `Status` VARCHAR(50),
    FOREIGN KEY (Book_ID) REFERENCES Books(Book_ID),
    FOREIGN KEY (Student_ID) REFERENCES Students(Student_ID)
);

SHOW TABLES;

DESC Students;
DESC Books;
DESC Borrowing;
DESC Librarians;

/*
Inserting values into Students table.
*/
INSERT INTO Students (Student_ID, `Name`, Email, Major) VALUES
(1, 'Alice Johnson', 'alice.johnson@example.com', 'Computer Science'),
(2, 'Bob Smith', 'bob.smith@example.com', 'Mathematics'),
(3, 'Charlie Davis', 'charlie.davis@example.com', 'Physics'),
(4, 'David White', 'david.white@example.com', 'Engineering'),
(5, 'Emma Brown', 'emma.brown@example.com', 'Biology'),
(6, 'Fiona Miller', 'fiona.miller@example.com', 'Chemistry'),
(7, 'George Wilson', 'george.wilson@example.com', 'Economics'),
(8, 'Hannah Moore', 'hannah.moore@example.com', 'History'),
(9, 'Isaac Taylor', 'isaac.taylor@example.com', 'Psychology'),
(10, 'Jack Anderson', 'jack.anderson@example.com', 'Political Science'),
(11, 'Katie Thomas', 'katie.thomas@example.com', 'Philosophy'),
(12, 'Liam Harris', 'liam.harris@example.com', 'Mechanical Engineering'),
(13, 'Mia Martin', 'mia.martin@example.com', 'Software Engineering'),
(14, 'Nathan King', 'nathan.king@example.com', 'Electrical Engineering'),
(15, 'Olivia Scott', 'olivia.scott@example.com', 'Environmental Science'),
(16, 'Patrick Lewis', 'patrick.lewis@example.com', 'Astronomy'),
(17, 'Quinn Walker', 'quinn.walker@example.com', 'Marine Biology'),
(18, 'Rachel Hall', 'rachel.hall@example.com', 'Linguistics'),
(19, 'Samuel Allen', 'samuel.allen@example.com', 'Data Science'),
(20, 'Tina Young', 'tina.young@example.com', 'Artificial Intelligence'),
(21, 'Umar Hernandez', 'umar.hernandez@example.com', 'Civil Engineering'),
(22, 'Victoria Adams', 'victoria.adams@example.com', 'Genetics'),
(23, 'William Nelson', 'william.nelson@example.com', 'Cybersecurity'),
(24, 'Xavier Carter', 'xavier.carter@example.com', 'Robotics'),
(25, 'Yasmine Mitchell', 'yasmine.mitchell@example.com', 'Business Administration'),
(26, 'Zachary Perez', 'zachary.perez@example.com', 'Finance'),
(27, 'Amy Rogers', 'amy.rogers@example.com', 'Graphic Design'),
(28, 'Brian Stewart', 'brian.stewart@example.com', 'Sociology'),
(29, 'Clara Foster', 'clara.foster@example.com', 'Theater Arts'),
(30, 'Derek Reed', 'derek.reed@example.com', 'Music Technology');

SELECT * FROM Students;

/*
Inserting values into Books table.
*/
INSERT INTO Books (Book_ID, Title, Author, Genre, ISBN, Copies_Available) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', '9780061120084', 5),
(2, '1984', 'George Orwell', 'Dystopian', '9780451524935', 8),
(3, 'Pride and Prejudice', 'Jane Austen', 'Romance', '9781503290563', 6),
(4, 'The Great Gatsby', 'F. Scott Fitzgerald', 'Classic', '9780743273565', 7),
(5, 'Moby Dick', 'Herman Melville', 'Adventure', '9781503280786', 4),
(6, 'War and Peace', 'Leo Tolstoy', 'Historical', '9781400079988', 3),
(7, 'The Catcher in the Rye', 'J.D. Salinger', 'Fiction', '9780316769488', 5),
(8, 'Crime and Punishment', 'Fyodor Dostoevsky', 'Psychological', '9780486415871', 6),
(9, 'The Hobbit', 'J.R.R. Tolkien', 'Fantasy', '9780547928227', 10),
(10, 'Brave New World', 'Aldous Huxley', 'Science Fiction', '9780060850524', 7),
(11, 'The Lord of the Rings', 'J.R.R. Tolkien', 'Fantasy', '9780261102385', 5),
(12, 'Frankenstein', 'Mary Shelley', 'Horror', '9780486282114', 4),
(13, 'Dracula', 'Bram Stoker', 'Horror', '9780486411095', 6),
(14, 'The Odyssey', 'Homer', 'Epic', '9780140268867', 5),
(15, 'The Divine Comedy', 'Dante Alighieri', 'Poetry', '9780142437223', 3),
(16, 'The Brothers Karamazov', 'Fyodor Dostoevsky', 'Philosophical', '9780374528379', 4),
(17, 'Anna Karenina', 'Leo Tolstoy', 'Romance', '9780143035008', 6),
(18, 'Les Misérables', 'Victor Hugo', 'Historical', '9780451419439', 5),
(19, 'Don Quixote', 'Miguel de Cervantes', 'Adventure', '9780060934347', 7),
(20, 'The Iliad', 'Homer', 'Epic', '9780140275360', 4),
(21, 'Fahrenheit 451', 'Ray Bradbury', 'Dystopian', '9781451673319', 8),
(22, 'Jane Eyre', 'Charlotte Brontë', 'Classic', '9780141441146', 6),
(23, 'Wuthering Heights', 'Emily Brontë', 'Gothic', '9780141439556', 5),
(24, 'A Tale of Two Cities', 'Charles Dickens', 'Historical', '9780141439600', 7),
(25, 'Great Expectations', 'Charles Dickens', 'Classic', '9780141439569', 6),
(26, 'David Copperfield', 'Charles Dickens', 'Classic', '9780140439447', 5),
(27, 'Oliver Twist', 'Charles Dickens', 'Classic', '9780141439747', 7),
(28, 'The Picture of Dorian Gray', 'Oscar Wilde', 'Gothic', '9780141439576', 4),
(29, 'The Count of Monte Cristo', 'Alexandre Dumas', 'Adventure', '9780140449266', 6),
(30, 'The Three Musketeers', 'Alexandre Dumas', 'Historical', '9780140449266', 5),
(31, 'Treasure Island', 'Robert Louis Stevenson', 'Adventure', '9780141321004', 7),
(32, 'Alice in Wonderland', 'Lewis Carroll', 'Fantasy', '9781503250215', 8),
(33, 'Gulliver’s Travels', 'Jonathan Swift', 'Satire', '9780141439491', 5),
(34, 'The Scarlet Letter', 'Nathaniel Hawthorne', 'Historical', '9780142437267', 4),
(35, 'Madame Bovary', 'Gustave Flaubert', 'Realism', '9780140449129', 6),
(36, 'The Metamorphosis', 'Franz Kafka', 'Absurdist', '9780553213690', 3),
(37, 'Heart of Darkness', 'Joseph Conrad', 'Modernist', '9780141441672', 5),
(38, 'The Stranger', 'Albert Camus', 'Philosophical', '9780679720201', 6),
(39, 'One Hundred Years of Solitude', 'Gabriel García Márquez', 'Magical Realism', '9780060883287', 4),
(40, 'Lolita', 'Vladimir Nabokov', 'Contemporary', '9780679723165', 3),
(41, 'Catch-22', 'Joseph Heller', 'Satire', '9781451626650', 7),
(42, 'Slaughterhouse-Five', 'Kurt Vonnegut', 'Science Fiction', '9780440180296', 5),
(43, 'The Road', 'Cormac McCarthy', 'Post-Apocalyptic', '9780307387899', 6),
(44, 'Life of Pi', 'Yann Martel', 'Adventure', '9780156027328', 5),
(45, 'The Alchemist', 'Paulo Coelho', 'Philosophical', '9780061122415', 7),
(46, 'Beloved', 'Toni Morrison', 'Historical', '9781400033416', 5),
(47, 'White Teeth', 'Zadie Smith', 'Contemporary', '9780375703867', 6),
(48, 'The Handmaid’s Tale', 'Margaret Atwood', 'Dystopian', '9780385490818', 5),
(49, 'The Book Thief', 'Markus Zusak', 'Historical', '9780375842207', 8),
(50, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Non-Fiction', '9780062316097', 4);

SELECT * FROM Books;

/*
Inserting values into Librarians table.
*/
INSERT INTO Librarians (Librarian_ID, `Name`, Email) VALUES
(1, 'Olivia Roberts', 'olivia.roberts@example.com'),
(2, 'Ethan Walker', 'ethan.walker@example.com'),
(3, 'Sophia Hall', 'sophia.hall@example.com'),
(4, 'Mason Allen', 'mason.allen@example.com'),
(5, 'Ava Young', 'ava.young@example.com'),
(6, 'Logan King', 'logan.king@example.com'),
(7, 'Harper Scott', 'harper.scott@example.com'),
(8, 'Daniel Green', 'daniel.green@example.com'),
(9, 'Lily Adams', 'lily.adams@example.com'),
(10, 'Noah Baker', 'noah.baker@example.com');

SELECT * FROM Librarians;

/*
Creating a Trigger to prevent borrowing if there are no available books.
*/
DELIMITER $$
CREATE TRIGGER before_borrow_insert
BEFORE INSERT ON Borrowing
FOR EACH ROW
BEGIN
	DECLARE available INT;
    SELECT Copies_Available INTO available FROM Books WHERE Book_ID = NEW.Book_ID;
    IF available <= 0 THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No copies available for this book!';
	END IF;
END$$
DELIMITER ;

/*
Creating a Trigger to automatically decrease the number of borrowed books.
*/
DELIMITER $$
CREATE TRIGGER after_borrow_insert
AFTER INSERT ON Borrowing
FOR EACH ROW
BEGIN
	UPDATE Books
	SET Copies_Available = Copies_Available - 1
    WHERE Book_ID = NEW.Book_ID;
END$$
DELIMITER ;

/*
Creating a Trigger to automatically increase the number of returned books.
*/
DELIMITER $$
CREATE TRIGGER after_return_update
AFTER UPDATE ON Borrowing
FOR EACH ROW
BEGIN
	#Avoids double returns.
	IF NEW.`Status` = 'Returned' AND OLD.`Status` <> 'Returned' THEN
		UPDATE Books
        SET Copies_Available = Copies_Available + 1
        WHERE Book_ID = NEW.Book_ID;
	END IF;
END$$
DELIMITER ;

/*
Creating a Trigger to mark/flag overdue books.
*/
DELIMITER $$
CREATE TRIGGER mark_overdue_update
BEFORE UPDATE ON Borrowing
FOR EACH ROW
BEGIN
	IF NEW.Return_Date IS NULL AND OLD.Borrow_Date <= DATE_SUB(CURDATE(), INTERVAL 14 DAY) THEN
		SET NEW.`Status` = 'Overdue';
	END IF;
END$$
DELIMITER ;

/*
Adding metadata column
Data was imported from Python
*/
ALTER TABLE Books ADD COLUMN book_metadata JSON;

INSERT INTO Borrowing
VALUES (1,1,1,'2025-05-01','2025-05-15','Not Returned');