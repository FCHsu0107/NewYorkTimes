# NewYorkTimes

## Environment Setup

### New York Time User API Key
1. [Create an account](https://developer.nytimes.com/accounts/create), verify the account and give a api key
2. Create a file  ```keys.plist ``` in ```Supporting Files``` folder
3. Add a dictionary whose key is ```clientKey```, and value is the api key provided from step 1

## Specs: The Feature of Log into app (Log in Page)

### Scenarios
```
Provide users a log-in interface
1. User can type user name and password 
2. User also can use biometric authentication after first log-in
```

## Use cases

### Log a user into app with user name and password

#### Data:
* User Name:  ```String```
* Password:  ```String```

#### Main process (happy path):
1. Check thatuser name and password are not empty
2. Post the user info to server
3. System receives a token and save it in Keychain
5. System delivers the result and switch to next page

#### Empty data (sad path):
System finds the data is missing and display an alert on the screen

#### Authentication data (sad path):
System delivers authentication error and display an alert with error message on the screen

### Log a user into app with face ID or touch ID

#### Main process (happy path):
1. System identifies user with biometrics
2. System authenticates id sucessfully
5. System switch to next page

#### Invalid device with biometrics  (sad path):
System cannot support authentication and display an alert with error message on the screen

#### Authentication data (sad path):
System delivers iauthentication error and display an alert with error message on the screen


### Flowchart
<img src="https://raw.githubusercontent.com/FCHsu0107/MDImages/main/NewYorkTimes/NewYorkTimes-Log.png" alt="" width="490" height = "510" align="center" />


## Specs: The Feature of best sellers list (Book List Page)

### Scenarios
```
1. Display some information of best sellers
2. Display the full discription when the card is clicked
```

## Use cases

### Load books list from server

#### Data:
* JSON 

#### Main process (happy path):
1. Execute ‘func getList’ to get data 
2. System receives the data from the server
3. System validates downloaded data
4. System creates the books item from validated data
5. System delivers the result and display the result on the screen

#### Invalid data (sad path):
System delivers invalidated data error and display the error message on the screen

#### Connectivity issue (sad path):
System delivers connectivity error and display the error message on the screen

***

### Flowchart
<img src="https://raw.githubusercontent.com/FCHsu0107/MDImages/main/NewYorkTimes/NewYorkTimes.png" alt="" width="360" height = "540" align="center" />


## Model Specs

### Books

|  Property  |  Type       |
| ---------- | :-----------:
|  ```results```  |  ```[Book]```       |
|  ```numResults```  |  ```Int```       |

### Book

|  Property  |  Type       |
| ---------- | :-----------:
|  ```title```  |  ```String```       |
|  ```resultDescription```  |  ```String(optional)```       |
|  ```author```  |  ```String```       |
|  ```price```  |  ```String```       |

***

## Architecture


<img src="https://raw.githubusercontent.com/FCHsu0107/MDImages/main/NewYorkTimes/NewYorkTimes-Architecture.png" alt="" width="810" height = "440" align="center" />

***
