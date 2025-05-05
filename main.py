import mysql.connector
import json
import xml.etree.ElementTree as ET
from xml.dom import minidom

#JSON records of books
book_metadata = [
    (1, {"publisher": "Vintage", "edition": "3rd", "summary": "A reflection on human nature and society."}),
    (2, {"publisher": "Penguin", "edition": "2nd", "summary": "A dystopian tale of surveillance and rebellion."}),
    (3, {"publisher": "Random House", "edition": "1st", "summary": "A story of love and societal expectations."}),
    (4, {"publisher": "Oxford Press", "edition": "2nd", "summary": "The opulence and tragedy of the American dream."}),
    (5, {"publisher": "HarperCollins", "edition": "4th", "summary": "A man's obsession leads to a deadly journey at sea."}),
    (6, {"publisher": "Cambridge Press", "edition": "1st", "summary": "An epic of war, peace, and Russian society."}),
    (7, {"publisher": "Back Bay Books", "edition": "3rd", "summary": "A teenager's critique of adulthood and phoniness."}),
    (8, {"publisher": "Modern Library", "edition": "2nd", "summary": "A psychological journey into guilt and redemption."}),
    (9, {"publisher": "Mariner Books", "edition": "5th", "summary": "A hobbit's adventure to reclaim a stolen treasure."}),
    (10, {"publisher": "Harper Perennial", "edition": "3rd", "summary": "A futuristic society governed by genetic control."}),
    (11, {"publisher": "Allen & Unwin", "edition": "2nd", "summary": "A journey through Middle-earth to destroy the One Ring."}),
    (12, {"publisher": "Dover Publications", "edition": "1st", "summary": "A scientist creates life with tragic consequences."}),
    (13, {"publisher": "Wordsworth Editions", "edition": "3rd", "summary": "A vampire's pursuit of immortality and blood."}),
    (14, {"publisher": "Penguin Classics", "edition": "2nd", "summary": "An epic voyage full of challenges and gods."}),
    (15, {"publisher": "Everyman's Library", "edition": "3rd", "summary": "A poetic vision of the afterlife."}),
    (16, {"publisher": "Farrar, Straus and Giroux", "edition": "1st", "summary": "A philosophical exploration of faith and morality."}),
    (17, {"publisher": "Penguin", "edition": "2nd", "summary": "A woman's pursuit of love against societal norms."}),
    (18, {"publisher": "Signet Classics", "edition": "4th", "summary": "A tale of justice, redemption, and revolution."}),
    (19, {"publisher": "Ecco", "edition": "3rd", "summary": "A knight's misadventures in pursuit of chivalry."}),
    (20, {"publisher": "Penguin Classics", "edition": "1st", "summary": "The wrath of Achilles in the Trojan War."}),
    (21, {"publisher": "Ballantine Books", "edition": "3rd", "summary": "A fireman rebels in a world where books are banned."}),
    (22, {"publisher": "Penguin", "edition": "2nd", "summary": "A governess falls for her employer with a dark past."}),
    (23, {"publisher": "Vintage", "edition": "3rd", "summary": "A haunting story of love and revenge."}),
    (24, {"publisher": "Oxford Press", "edition": "1st", "summary": "A dramatic contrast of London and Paris during revolution."}),
    (25, {"publisher": "Penguin Classics", "edition": "2nd", "summary": "A boy navigates social mobility and disappointment."}),
    (26, {"publisher": "Oxford Press", "edition": "3rd", "summary": "A coming-of-age tale of hardship and resilience."}),
    (27, {"publisher": "Wordsworth Editions", "edition": "1st", "summary": "An orphan survives the dark underworld of London."}),
    (28, {"publisher": "Penguin Classics", "edition": "2nd", "summary": "A man's descent into vanity and corruption."}),
    (29, {"publisher": "Penguin", "edition": "4th", "summary": "A tale of vengeance, imprisonment, and justice."}),
    (30, {"publisher": "Penguin", "edition": "3rd", "summary": "Three swordsmen defend justice and friendship."}),
    (31, {"publisher": "Puffin Classics", "edition": "2nd", "summary": "A boy's treasure-hunting voyage at sea."}),
    (32, {"publisher": "CreateSpace", "edition": "3rd", "summary": "A girl falls into a fantastical world of nonsense."}),
    (33, {"publisher": "Penguin Classics", "edition": "1st", "summary": "A traveler's exaggerated journeys across strange lands."}),
    (34, {"publisher": "Penguin", "edition": "2nd", "summary": "A woman's public shame in Puritan New England."}),
    (35, {"publisher": "Penguin Classics", "edition": "1st", "summary": "A woman's dissatisfaction leads to tragedy."}),
    (36, {"publisher": "Bantam Classics", "edition": "3rd", "summary": "A man transforms into an insect and is rejected."}),
    (37, {"publisher": "Penguin", "edition": "2nd", "summary": "A journey into colonial Africa's moral darkness."}),
    (38, {"publisher": "Vintage", "edition": "1st", "summary": "An indifferent man's confrontation with existence."}),
    (39, {"publisher": "Harper", "edition": "2nd", "summary": "A magical story of generations and solitude."}),
    (40, {"publisher": "Vintage", "edition": "3rd", "summary": "A controversial tale of obsession and manipulation."}),
    (41, {"publisher": "Simon & Schuster", "edition": "1st", "summary": "A satirical novel about the absurdity of war."}),
    (42, {"publisher": "Dell", "edition": "2nd", "summary": "A soldier unstuck in time during WWII."}),
    (43, {"publisher": "Vintage", "edition": "3rd", "summary": "A father and son's survival in a post-apocalyptic world."}),
    (44, {"publisher": "Mariner Books", "edition": "1st", "summary": "A boy's adventure of survival and storytelling."}),
    (45, {"publisher": "HarperOne", "edition": "2nd", "summary": "A shepherd's journey to fulfill his personal legend."}),
    (46, {"publisher": "Vintage", "edition": "3rd", "summary": "A mother haunted by slavery and loss."}),
    (47, {"publisher": "Vintage", "edition": "2nd", "summary": "A humorous and poignant portrait of modern families."}),
    (48, {"publisher": "Anchor Books", "edition": "1st", "summary": "A totalitarian regime subjugates women."}),
    (49, {"publisher": "Knopf", "edition": "3rd", "summary": "A girl finds solace in books during Nazi Germany."}),
    (50, {"publisher": "Harper", "edition": "2nd", "summary": "A sweeping history of humankind from prehistory to now."})
]

#Importing metadata 
def insert_book_with_metadata(book_id, metadata):

    #Connecting to database
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="library_system"
    )

    #Create a cursor 
    cursor = conn.cursor()

    try:
        #Ensure book_id is an integer
        book_id = int(book_id)
        
        #Convert dictionary to JSON string
        metadata_json = json.dumps(metadata)
        
        #Update the book's metadata
        cursor.execute(
            "UPDATE Books SET book_metadata = %s WHERE Book_ID = %s",
            (metadata_json, book_id)
        )

        #Debug output
        print(f"Affected rows for Book_ID={book_id}: {cursor.rowcount}")

    except mysql.connector.Error as e:
        print(f"Error for Book_ID={book_id}: {e}")

    #Save changes
    conn.commit()

    #Clean up
    cursor.close()
    conn.close()

#Exporting XML
def export_borrowing_to_xml():

    #Connecting to database
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="library_system"
    )

    #Create a cursor 
    cursor = conn.cursor(dictionary=True)

    #Fetch borrowing records
    cursor.execute("SELECT * FROM Borrowing")
    records = cursor.fetchall()

    #Building XML structure
    root = ET.Element("BorrowingRecords")

    for record in records:
        borrow_element = ET.SubElement(root, "Borrowing")
        for key, value in record.items():
            child = ET.SubElement(borrow_element, key)
            child.text = str(value) if value is not None else ""

    #Convert to string 
    xml_str = ET.tostring(root, encoding="utf-8")
    parsed = minidom.parseString(xml_str)
    pretty_xml = parsed.toprettyxml(indent="    ")

    #Writing to a file
    with open("borrowing_records.xml", "w", encoding="utf-8") as f:
        f.write(pretty_xml)

    #Clean up
    cursor.close()
    conn.close()

#Verify user type
def verify_user_type():

    #Ask for user type until a valid answer
    while True:
        print("Type 1 -> Librarian.")
        print("Type 2 -> Student.")
        try:
            user_type = int(input("Enter your type: ").strip())

            if user_type in [1, 2]:
                break
            else:
                print("Invalid input.")
        
        except ValueError:
            print("Invalid input. Please enter 1 or 2.")

#Verify user id
def verify_user_id(user_type):

    #Connecting to database
    conn = mysql.connector.connect(
        host="localhost",
        user="root",
        password="root",
        database="library_system"
    )

    #Create a cursor
    cursor = conn.cursor()

    #Confirming if a user_id exists for librarians or students
    while True:
        try:
            user_id = int(input("Enter your id: ").strip())
            
            #To create a one element tuple (user_id,) is written with a comma.
            if user_type == 1:
                cursor.execute("SELECT * FROM Librarians WHERE Librarian_ID = %s", (user_id,))
            else:
                cursor.execute("SELECT * FROM Students WHERE Student_ID = %s", (user_id,))

            if cursor.fetchone():
                print("User ID verified.")
                return user_id
            else:
                print("ID not found. Try again.")
        
        except ValueError:
            print("Invalid ID. Please enter a number.")
        
            
        except ValueError:
            print("Invalid id.")


def main():
    
    #Loop through and insert each record
    """
    for book_id, metadata in book_metadata:
        insert_book_with_metadata(book_id, metadata)
    """

    print("Welcome to the Library Management System!")

    user_type = verify_user_type()
    user_id = verify_user_id(user_type)

    
if __name__ == "__main__":
    main()