import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutterapp/model/movie.dart';
import 'package:flutterapp/model/question.dart';
import 'package:flutterapp/util/hexcolor.dart';

import 'movie_ui/movie_ui.dart';

class MovieListView extends StatelessWidget {
  final List<Movie> movieList = Movie.getMovies();

  final List movies = [
    "Titanic",
    "Blade Rummer",
    "Rambo",
    "The Avengers",
    "Avtar",
    "I Am Legend",
    "300",
    "The wolf of wall street",
    "Interstellar",
    "Game of Thoromes",
    "Vikings"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      backgroundColor: Colors.blueGrey.shade900,
      body: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            return Stack(children: <Widget>[
              movieCard(movieList[index], context),
              Positioned(
                  top: 10, child: movieImage(movieList[index].images[0])),
            ]);
//              elevation: 4.5,
//              color: Colors.white,
//              child: ListTile(
//                leading: CircleAvatar(
//                  child: Container(
//                    width: 200,
//                    height: 200,
//                    decoration: BoxDecoration(
//                        image: DecorationImage(
//                            image: NetworkImage(movieList[index].images[1]),
//                            fit: BoxFit.cover),
////                        color: Colors.blue,
//                        borderRadius: BorderRadius.circular(13.9)),
//                    child: Text("H"),
//                  ),
//                ),
//                trailing: Text("...."),
//                title: Text(movieList[index].title),
//                subtitle: Text("${movieList[0].title}"),
//                onTap: () {
//                  Navigator.push(
//                      context,
//                      MaterialPageRoute(
//                          builder: (context) => MovieListViewDetails(
//                                movieName: movieList.elementAt(index).title,
//                                movie: movieList[index],
//                              )));
//                },
//              ),
//            );
          }),
    );
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
        child: Container(
          margin: EdgeInsets.only(left: 60),
          width: MediaQuery.of(context).size.width,
          height: 120,
          child: Card(
            color: Colors.black45,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Flexible(
                          child: Text(
                            movie.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                                color: Colors.white),
                          ),
                        ),
                        Text(
                          "Rating: ${movie.imDbRatings} / 10",
                          style: TextStyle(fontSize: 15.0, color: Colors.grey),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Text(
                          "Released : ${movie.released}",
                          style: mainTextStyle(),
                        ),
                        Text(
                          movie.runTime,
                          style: mainTextStyle(),
                        ),
                        Text(
                          movie.rated,
                          style: mainTextStyle(),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MovieListViewDetails(
                      movieName: movie.title,
                      movie: movie,
                    ))));
  }

  TextStyle mainTextStyle() {
    return TextStyle(fontSize: 15.0, color: Colors.grey);
  }

  Widget movieImage(String imgUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(
                  imgUrl ?? "https://picsum.photos/id/237/200/300"),
              fit: BoxFit.cover)),
    );
  }
}

//new route(screen or page)
class MovieListViewDetails extends StatelessWidget {
  final String movieName;
  final Movie movie;

  const MovieListViewDetails({Key key, this.movieName, this.movie})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movies"),
        backgroundColor: Colors.blueGrey.shade900,
      ),
      body: ListView(
        children: <Widget>[
          MovieDetailsThumbnail(
            thumbNail: movie.images[0],
          ),
          MovieDetailsHeaderWithPoster(
            movie: movie,
          ),
          HorizontalLine(),
          MovieDetailsCast(
            movie: movie,
          ),
          HorizontalLine(),
          MovieExtraPosters(
            posters: movie.images,
          )
        ],
      ),
//      body: Center(
//        child: Container(
//          child: RaisedButton(
//            child: Text("Go Back ${this.movie.director}"),
//            onPressed: () {
//              Navigator.pop(context);
//            },
//          ),
//        ),
//      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name(
        ("Amartya Sen was awarded the Nobel prize for his contribution to Welfare Economics."),
        true),
    Question.name(
        ("The Headquarters of the Southern Naval Command of the India Navy is located at Thiruvananthapuram."),
        false),
    Question.name(
        ("William Hewlett and David Packard set up a small company called apple."),
        false),
    Question.name(
        ("Earth Rotation is also called annual motion of the earth?"), false),
    Question.name(
        ("Sachin Tendulkar has not played a single International T20 match for India."),
        false),
    Question.name(
        ("There are 4 sessions of the Parliament each year: Spring, Summer, Autumn and Winter."),
        false),
    Question.name(
        ("The Captain Roop Singh stadium is named after a former Indian cricketer."),
        false),
    Question.name(("The Mahabharata is a part of The Bhagavad Gita."), false)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("True Citizen"),
        centerTitle: true,
//        backgroundColor: Colors.blueGrey,
      ),
//      backgroundColor: Colors.blueGrey,
      body: Builder(
        builder: (BuildContext context) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Image.asset(
                  "images/flag.png",
                  width: 250,
                  height: 180,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                        color: Colors.blueGrey.shade400,
                        style: BorderStyle.solid),
                  ),
                  height: 120.0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                        child: Text(
                      questionBank[_currentQuestionIndex].questionText,
//                      style: TextStyle(fontSize: 16.9, color: Colors.white),
                    )),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => _checkAnswer(true, context),
                    color: Colors.grey.shade900,
                    child: Text(
                      "TRUE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _checkAnswer(false, context),
                    color: Colors.grey.shade900,
                    child: Text(
                      "FALSE",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.grey.shade900,
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                  RaisedButton(
                    onPressed: () => _previousQuestion(),
                    color: Colors.grey.shade900,
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  _checkAnswer(bool userChoice, BuildContext context) {
    if (userChoice == questionBank[_currentQuestionIndex].isCorrect) {
      //Correct Answer
      final snackBar = SnackBar(
          backgroundColor: Colors.green,
          duration: Duration(milliseconds: 500),
          content: Text("Correct"));
      Scaffold.of(context).showSnackBar(snackBar);
      _nextQuestion();

      debugPrint("Yes Correct!");
    } else {
      final snackBar = SnackBar(
          backgroundColor: Colors.red,
          duration: Duration(milliseconds: 500),
          content: Text("InCorrect"));
      Scaffold.of(context).showSnackBar(snackBar);

      _nextQuestion();
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}

class BillSplitter extends StatefulWidget {
  @override
  _BillSplitterState createState() => _BillSplitterState();
}

class _BillSplitterState extends State<BillSplitter> {
  int _tipPercentage = 0;
  int _personCounter = 0;
  double _billAmount = 0.0;
  Color _purpule = HexColor("#6908D6");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child: ListView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(20.5),
          children: <Widget>[
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                  color: _purpule.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Total Per Person",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 15.0,
                          color: _purpule),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "\$ ${calculateTotalPerson(_billAmount, _personCounter, _tipPercentage)}",
                        style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.bold,
                            color: _purpule),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(
                      color: Colors.blueGrey.shade100,
                      style: BorderStyle.solid),
                  borderRadius: BorderRadius.circular(12.0)),
              child: Column(
                children: <Widget>[
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.grey),
                    decoration: InputDecoration(
                        prefixText: "Bill Amount",
                        prefixIcon: Icon(Icons.attach_money)),
                    onChanged: (String value) {
                      try {
                        _billAmount = double.parse(value);
                      } catch (exception) {
                        _billAmount = 0.0;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Split",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Row(
                        children: <Widget>[
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (_personCounter > 1) {
                                  _personCounter--;
                                } else {
                                  //nothing
                                }
                              });
                            },
                            child: Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: _purpule.withOpacity(0.1)),
                              child: Center(
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                      color: _purpule,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            "$_personCounter",
                            style: TextStyle(color: _purpule, fontSize: 17.0),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _personCounter++;
                              });
                            },
                            child: Container(
                              width: 40.0,
                              height: 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                  color: _purpule.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(7.0)),
                              child: Center(
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                      color: _purpule,
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  //Tip
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Tip",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Text(
                          "\$ ${(calculateTotalTip(_billAmount, _personCounter, _tipPercentage)).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: _purpule,
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      )
                    ],
                  ),
                  //Slider
                  Column(
                    children: <Widget>[
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(
                            color: _purpule,
                            fontWeight: FontWeight.bold,
                            fontSize: 17.0),
                      ),
                      Slider(
                        min: 0,
                        max: 100,
                        activeColor: _purpule,
                        inactiveColor: Colors.grey,
                        divisions: 10,
                        //optional
                        value: _tipPercentage.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            _tipPercentage = newValue.round();
                          });
                        },
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  calculateTotalPerson(double billAmount, int splitBy, int tipPercentage) {
    var totalPerPerson =
        (calculateTotalTip(billAmount, splitBy, tipPercentage) + billAmount) /
            splitBy;
    return totalPerPerson.toStringAsFixed(2);
  }

  calculateTotalTip(double billAmount, int splitBy, int tipPercentage) {
    double totalTip = 0.0;
    if (billAmount < 0 || billAmount.toString().isEmpty || billAmount == null) {
      //nothing
    } else {
      totalTip = (billAmount * tipPercentage) / 100;
    }
    return totalTip;
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  int _index = 0;
  List quotes = [
    "Be yourself; everyone else is already taken.",
    "You've gotta dance like there's nobody watching, Love like you'll never be hurt, Sing like there's nobody listening, And live like it's heaven on earth.",
    "Be the change that you wish to see in the world.",
    "No one can make you feel inferior without your consent.",
    "Live as if you were to die tomorrow. Learn as if you were to live forever.",
    "Without music, life would be a mistake.",
    "We accept the love we think we deserve.",
    "We are all in the gutter, but some of us are looking at the stars."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular((14.5))),
                    child: Center(
                        child: Text(quotes[_index % quotes.length],
                            style: TextStyle(
                                color: Colors.grey.shade600,
                                fontStyle: FontStyle.italic,
                                fontSize: 16.5)))),
              ),
            ),
            Divider(
              thickness: 1.3,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: FlatButton.icon(
                  onPressed: _showQuote,
                  color: Colors.greenAccent.shade700,
                  icon: Icon(Icons.wb_sunny),
                  label: Text(
                    "Inspire me!",
                    style: TextStyle(fontSize: 18.8, color: Colors.white),
                  )),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
//increment index count by 1
    setState(() {
      _index += 1;
    });
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("BizCard")),
      backgroundColor: Colors.redAccent,
      body: Container(
        alignment: Alignment.center,
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[_getCard(), _getAvtar()],
        ),
      ),
    );
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      margin: EdgeInsets.all(50.0),
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(14.5)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Twisha",
            style: TextStyle(
                fontSize: 20.9,
                fontWeight: FontWeight.w500,
                color: Colors.white),
          ),
          Text("kotechatwisha.blogspot.com",
              style: TextStyle(color: Colors.red)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.person_outline),
              Text("Here you go!", style: TextStyle(color: Colors.red))
            ],
          )
        ],
      ),
    );
  }

  Container _getAvtar() {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(50.0)),
          border: Border.all(color: Colors.redAccent, width: 1.2),
          image: DecorationImage(
              image: NetworkImage("https://picsum.photos/200/300"),
              fit: BoxFit.cover)),
    );
  }
}

class ScaffoldExample extends StatelessWidget {
  _tapButton() {
    debugPrint("Tapped Button!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        centerTitle: true,
        backgroundColor: Colors.amberAccent.shade700,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.email),
            onPressed: () => debugPrint("Email Tapped!"),
          ),
          IconButton(
            icon: Icon(Icons.alarm),
            onPressed: () => _tapButton(),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightGreenAccent,
        child: Icon(Icons.call_missed),
        onPressed: () => debugPrint("Hello"),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "First"),
          BottomNavigationBarItem(
              icon: Icon(Icons.ac_unit), label: "Second"),
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), label: "Third"),
        ],
        onTap: (int index) => debugPrint("Tapped item : $index"),
      ),
      backgroundColor: Colors.redAccent.shade100,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
//            InkWell(
//              child: Text(
//                "Tap Me!",
//                style: TextStyle(fontSize: 23.4),
//              ),
//              onTap: () => debugPrint("Tapped..."),
//            )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final snackBar = SnackBar(
          content: Text("Hello Again!"),
          backgroundColor: Colors.amberAccent.shade700,
        );
        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
            color: Colors.pinkAccent, borderRadius: BorderRadius.circular(8.0)),
        child: Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.deepOrange,
      child: Center(
        child: Text(
          "Hello Flutter",
          textDirection: TextDirection.ltr,
          style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 23.4,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
