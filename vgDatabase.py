from tkinter import *
import sqlite3


root = Tk()
root.title('VideoGame Database')
root.geometry("500x600")


# Database

# Connect to database
connection = sqlite3.connect('Videogames.db')

# Create cursor
cursor = connection.cursor()

# create save Function
def save():
    # Connect to database
    connection = sqlite3.connect('Videogames.db')

    # Create cursor
    cursor = connection.cursor()

    record_id = delete_box.get()

    cursor.execute("""UPDATE Game SET
            gameId = :gId,
            gameName = :gName,
            releaseDate = :rDate,
            hoursPlayed = :hPlay,
            genreId = :genId,
            platformId = :pId

            WHERE oid = :oid""",
            {'gId': ugameId.get(),
             'gName': ugame_name.get(),
             'rDate': urelease_date.get(),
             'hPlay': uhours.get(),
             'genId': ugenreId.get(),
             'pId': uplatformId.get(),
             'oid': record_id
            })

    # Commit changes
    connection.commit()

    # Close Connection
    connection.close()

    updater.destroy()

# create update Function
def update():
    global updater
    updater = Tk()
    updater.title('Update a Record')
    updater.geometry("400x300")
    # Connect to database
    connection = sqlite3.connect('Videogames.db')

    # Create cursor
    cursor = connection.cursor()

    record_id = delete_box.get()
    # QUERY THE Database
    cursor.execute("SELECT * FROM Game WHERE gameId = " + record_id)
    records = cursor.fetchall()

    # create gloabl for text box names
    global ugameId
    global ugame_name
    global urelease_date
    global uhours
    global ugenreId
    global uplatformId
    # Create text boxes
    ugameId = Entry(updater, width=30)
    ugameId.grid(row=0, column=1, padx=20, pady=(10,0))
    ugame_name = Entry(updater, width=30)
    ugame_name.grid(row=1, column=1)
    urelease_date = Entry(updater, width=30)
    urelease_date.grid(row=2, column=1)
    uhours = Entry(updater, width=30)
    uhours.grid(row=3, column=1)
    ugenreId = Entry(updater, width=30)
    ugenreId.grid(row=4, column=1)
    uplatformId = Entry(updater, width=30)
    uplatformId.grid(row=5, column=1)

    # Create text boxe labels
    ugameId_label = Label(updater, text="Game ID")
    ugameId_label.grid(row=0, column=0, pady=(10,0))

    ugame_name_label = Label(updater, text="Game Name")
    ugame_name_label.grid(row=1, column=0)

    urelease_date_label = Label(updater, text="Release Date")
    urelease_date_label.grid(row=2, column=0)

    uhours_label = Label(updater, text="Hours Played")
    uhours_label.grid(row=3, column=0)

    ugenre_label = Label(updater, text="Genre ID")
    ugenre_label.grid(row=4, column=0)

    uplatform_label = Label(updater, text="Platform ID")
    uplatform_label.grid(row=5, column=0)

    # loop thru results
    for record in records:
        ugameId.insert(0, record[0])
        ugame_name.insert(0, record[1])
        urelease_date.insert(0, record[2])
        uhours.insert(0, record[3])
        ugenreId.insert(0, record[4])
        uplatformId.insert(0, record[5])

    # creat an save Button
    save_btn = Button(updater, text="Save Record", command=save)
    save_btn.grid(row=6, column=0, columnspan=2, pady=10, padx=10, ipadx=136)


# Create DELETE Function
def delete():
    # Connect to database
    connection = sqlite3.connect('Videogames.db')

    # Create cursor
    cursor = connection.cursor()

    # Delete a Record
    cursor.execute("DELETE FROM Game WHERE gameId = " + delete_box.get())

    # Commit changes
    connection.commit()

    # Close Connection
    connection.close()

    #Clear the text boxes
    delete_box.delete(0, END)

#Create submit function for database
def submit():
    # Connect to database
    connection = sqlite3.connect('Videogames.db')

    # Create cursor
    cursor = connection.cursor()

    # INSERT INTO TABLE
    cursor.execute("INSERT INTO Game VALUES (:gameId, :game_name, :release_date, :hours, :genreId, :platformId)",
                {
                    'gameId': gameId.get(),
                    'game_name': game_name.get(),
                    'release_date': release_date.get(),
                    'hours': hours.get(),
                    'genreId': genreId.get(),
                    'platformId': platformId.get()
                })

    # Commit changes
    connection.commit()

    # Close Connection
    connection.close()


    #Clear the text boxes
    gameId.delete(0, END)
    game_name.delete(0, END)
    release_date.delete(0, END)
    hours.delete(0, END)
    genreId.delete(0, END)
    platformId.delete(0, END)

#Create Query Function
def query1():
    query1 = Tk()
    query1.title('Query 1')
    query1.geometry("190x175")
    # Connect to database
    connection = sqlite3.connect('Videogames.db')

    # Create cursor
    cursor = connection.cursor()

    # QUERY THE Database
    cursor.execute('SELECT gameName FROM Game WHERE gameName LIKE "%Super %"')
    records = cursor.fetchall()

    print_records = ''
    for record in records:
        print_records += str(record[0]) + "\n"

    query_label = Label(query1, text=print_records)
    query_label.grid(row=0, column=0, columnspan=2)

    # Commit changes
    connection.commit()

    # Close Connection
    connection.close()

#Create Query Function
def query2():
    query2 = Tk()
    query2.title('Query 2')
    query2.geometry("300x150")
    # Connect to database
    connection = sqlite3.connect('Videogames.db')

    # Create cursor
    cursor = connection.cursor()

    # QUERY THE Database
    cursor.execute("""SELECT sum(hoursPlayed), developerName FROM DevelopGame
    JOIN Developer ON DevelopGame.developerId = Developer.developerId JOIN Game
    ON DevelopGame.gameId = Game.gameId GROUP BY developerName HAVING
    sum(hoursPlayed) > 500""")
    records = cursor.fetchall()

    print_records = ''
    for record in records:
        print_records += str(record[0]) + ' hours with ' + str(record[1]) + "\n"

    query_label = Label(query2, text=print_records)
    query_label.grid(row=0, column=0, columnspan=2)

    # Commit changes
    connection.commit()

    # Close Connection
    connection.close()

#Create Query Function
def query3():
    query3 = Tk()
    query3.title('Query 3')
    query3.geometry("350x65")
    # Connect to database
    connection = sqlite3.connect('Videogames.db')

    # Create cursor
    cursor = connection.cursor()

    # QUERY THE Database
    cursor.execute("""SELECT gameName, hoursPlayed
FROM Game JOIN Genre ON Genre.genreId = Game.genreId
WHERE genreName = 'Shooter' AND hoursPlayed >
 (SELECT sum(hoursPlayed)
  FROM Game JOIN Genre ON Genre.genreId = Game.genreId
  WHERE genreName = 'Puzzle') """)
    records = cursor.fetchall()

    print_records = ''
    for record in records:
        print_records += str(record[0]) + ' - hours played: ' + str(record[1]) + "\n"

    query_label = Label(query3, text=print_records)
    query_label.grid(row=0, column=0, columnspan=2)

    # Commit changes
    connection.commit()

    # Close Connection
    connection.close()

# Create text boxes
gameId = Entry(root, width=30)
gameId.grid(row=0, column=1, padx=20, pady=(10,0))
game_name = Entry(root, width=30)
game_name.grid(row=1, column=1)
release_date = Entry(root, width=30)
release_date.grid(row=2, column=1)
hours = Entry(root, width=30)
hours.grid(row=3, column=1)
genreId = Entry(root, width=30)
genreId.grid(row=4, column=1)
platformId = Entry(root, width=30)
platformId.grid(row=5, column=1)

delete_box = Entry(root, width=30)
delete_box.grid(row=9, column=1, pady=5)

# Create text boxe labels
gameId_label = Label(root, text="Game ID")
gameId_label.grid(row=0, column=0, pady=(10,0))

game_name_label = Label(root, text="Game Name")
game_name_label.grid(row=1, column=0)

release_date_label = Label(root, text="Release Date")
release_date_label.grid(row=2, column=0)

hours_label = Label(root, text="Hours Played")
hours_label.grid(row=3, column=0)

genre_label = Label(root, text="Genre ID")
genre_label.grid(row=4, column=0)

platform_label = Label(root, text="Platform ID")
platform_label.grid(row=5, column=0)

delete_box_label = Label(root, text="Select Game ID")
delete_box_label.grid(row=9, column=0)

# Create Submit button
submit_btn = Button(root, text="Add Record to Database", command=submit)
submit_btn.grid(row=6, column=0, columnspan=2, pady=10, padx=10, ipadx=100)

# Create a Query button
query_btn = Button(root, text="Query 1", command=query1)
query_btn.grid(row=12, column=0, columnspan=2, pady=10, padx=10, ipadx=137)

# Create a Query button
query_btn = Button(root, text="Query 2", command=query2)
query_btn.grid(row=13, column=0, columnspan=2, pady=10, padx=10, ipadx=137)

# Create a Query button
query_btn = Button(root, text="Query 3", command=query3)
query_btn.grid(row=14, column=0, columnspan=2, pady=10, padx=10, ipadx=137)

# Create delete button
delete_btn = Button(root, text="Delete Record", command=delete)
delete_btn.grid(row=10, column=0, columnspan=2, pady=10, padx=10, ipadx=136)

# creat an update Button
update_btn = Button(root, text="Update Record", command=update)
update_btn.grid(row=11, column=0, columnspan=2, pady=10, padx=10, ipadx=136)

# Commit changes
connection.commit()

# Close Connection
connection.close()

root.mainloop()
