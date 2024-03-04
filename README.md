# EduScope

## Introduction

EduScope is a comprehensive iOS application designed to provide an interactive platform for accessing and exploring New York City school data. With its intuitive user interface and seamless functionality, EduScope offers users a dynamic way to engage with school information.

## Screenshot

<img src="https://github.com/kri-eng/EduScope/assets/124129235/75ca08c9-7e73-4757-9b8d-a65c166888b0" alt="Xylophone-Screenshot" width=300>

<img src="https://github.com/kri-eng/EduScope/assets/124129235/46314db4-b4e3-4e06-aead-62933de7d759" alt="Xylophone-Screenshot" width=300>

<img src="https://github.com/kri-eng/EduScope/assets/124129235/74e6e0dd-d06f-4bab-b8c0-f9997c820a6b" alt="Xylophone-Screenshot" width=300>

<img src="https://github.com/kri-eng/EduScope/assets/124129235/73ed8cfa-762f-4455-9cd9-6ce61334c050" alt="Xylophone-Screenshot" width=300>

<img src="https://github.com/kri-eng/EduScope/assets/124129235/42c5701a-e3cf-48be-8033-f5967b7461c7" alt="Xylophone-Screenshot" width=300>

<img src="https://github.com/kri-eng/EduScope/assets/124129235/1e6fb5d6-6017-4c7c-9b3f-2fd4acf41848" alt="Xylophone-Screenshot" width=300>

<img src="https://github.com/kri-eng/EduScope/assets/124129235/9b2764c6-a66e-467e-adb6-5331dcfa462a" alt="Xylophone-Screenshot" width=300>


## User Interface

EduScope boasts a multi-screen interface comprising five distinct screens tailored to enhance user experience and accessibility:

### Intro Screen
- Displaying the EduScope logo and application name, this screen introduces users to the platform.
- Features a search button for seamless navigation to the main screen.

### Main Screen
- Offers a user-friendly navigation bar with a back button and the title "EduScope," accompanied by a search bar for streamlined school searches.
- Presents a table view showcasing school names and locations via custom table view cells.

### Details Screen
- Provides in-depth information about selected schools via a custom table view layout.
- Includes three distinct table view cells, each presenting vital school details:
  1. School name, location, and action buttons for calling the school, accessing the school's website via a WebKit view, and viewing the school's location on a map.
  2. Overview of the school.
  3. SAT scores for the school.

### WebKit View Screen
- Integrates a WebKit view to seamlessly display school websites, offering users direct access to additional information.

### Map View Screen
- Utilizes a map view to pinpoint school locations, facilitating easy navigation and visualization.

## Functionality

EduScope revolutionizes the exploration of NYC school data by offering a feature-rich experience:

- Upon launch, users are greeted with an animated introduction on the Intro screen, followed by seamless navigation to the Main screen via the search button.
- The application dynamically fetches school data through two API calls, ensuring comprehensive information retrieval:
  1. The first API call gathers essential school details such as names, locations, contact information, and overview.
  2. The second API call retrieves SAT scores for each school, providing valuable insights into academic performance.
- Utilizing the unique school identifier (dbn), EduScope aggregates data from these API calls, ensuring detailed and accurate school profiles.
- The Main screen empowers users to search and browse schools effortlessly, with the option to delve into detailed school profiles.
- Interaction with school profiles on the Details screen is intuitive, providing immediate access to essential information and functionalities such as contacting the school, exploring its website, and visualizing its location on a map.
- API calls are efficiently managed using URL sessions and JSON parsing, ensuring seamless data retrieval and integration.
- Real-time search functionality is facilitated through a filter array, enabling users to find relevant schools with ease.

## Learnings
- Desiging Application with Figma.
- Animation Generation.
- UIView Transitions.
- URL Sessions and JSON parsing.
- Completion Handlers.
- Custom protocols and delegates.
- Desiging Custom Table View Cells in XIB files.
- MVC Design Pattern.
- Intigrating Search Bar in Navigation Controller.
- Search Bar Implementation.
- WebKit View.
- MapKit.


