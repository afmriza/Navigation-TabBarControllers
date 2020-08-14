# Navigation-TabBarControllers
- application has six tabs in total.
- Tabs (1, 2, 3) each contain their own navigation controller.
## Tab One
- Contains a textfield where the user can add any topic they wish to search for o A button will ‘save’ this topic to the Tab Two data
- Saving will also clear the textfield
## Tab Two
- Displays list items the user ‘saved’ from Tab One
- Items are displayed in a table view
- Each cell will has a disclose indicator.
- Tapping on a cell does a Google search of the item and display it in WebViews in the next
  view controller
## Tab Three
- A simple ViewController with a text field. As an editing begins a Done button is shown on the navigation bar.
- When the Done button is tapped the keyboard is dismissed and the badge value on the third tab bar item should is updated 
## Tab Four
- Displays a label containing the badge value that was set in the third tab item.
- Every time the user navigates to this screen the background colour of the view will be a
  different colour
## Tab Five & Six
- Are dummy tabs
