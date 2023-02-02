 <?php

    // select all topics
    $topics = $conn->query("SELECT topic FROM questions");
    $topics = $topics->fetchAll(PDO::FETCH_ASSOC);
    $topics = array_unique($topics, SORT_REGULAR);

    if (!isset($_SESSION['score'])) {
        $_SESSION['score'] = 0;
    }
    // set default Message
    // set topic session

    // initialize current question index if not set
    if (!isset($_SESSION['current_question'])) {
        $_SESSION['current_question'] = 0;
    }

    ?>
 <header class="header-2">
     <div class="page-header min-vh-75 relative" style="background-image: url('./assets/img/bg_main.jpg')">
         <span class="mask bg-gradient-primary opacity-4"></span>
         <div class="container">
             <div class="row">
                 <div class="col-lg-7 text-center mx-auto">
                     <h1 class="text-white pt-3 mt-n5">Trivia Quiz</h1>
                     <p class="lead text-white mt-3">Are you ready for the Ultimate Quiz experience. <br /> Join the fun today.</p>
                 </div>
             </div>
         </div>
     </div>
 </header>

 <div class="card card-body blur shadow-blur mx-3 mx-md-4 mt-n6">
     <section class="my-5 py-5">

         <div class="container mt-sm-5 mt-3">
             <div class="row">
                 <div class="col-lg-3">
                     <?php if (!isset($_SESSION['topic'])) { ?>
                         <div class="position-sticky pb-lg-5 pb-3 mt-lg-0 mt-5 ps-2" style="top: 100px">
                             <h3>Category</h3>
                             <h6 class="text-secondary font-weight-normal pe-3">Please choose the category of the quiz you wanna do!</h6>
                         </div>
                     <?php } else { ?>
                         <div class="position-sticky pb-lg-5 pb-3 mt-lg-0 mt-5 ps-2" style="top: 100px">
                             <h3>Have Fun</h3>
                             <h6 class="text-secondary font-weight-normal pe-3">Have fun answering the Questions of the quiz!</h6>
                         </div>
                     <?php } ?>
                 </div>
                 <div class="col-lg-9">
                     <div class="row mt-3">
                         <?php if (!isset($_SESSION['topic']) && isset($_SESSION['LOGGEDIN']) && $_SESSION['LOGGEDIN'] == true) { ?>
                             <!-- Questions -->
                             <form action="" method="post">
                                 <div class="col-12">
                                     <div class="position-relative border-radius-xl overflow-hidden shadow-lg mb-7">
                                         <div class="container border-bottom">
                                             <div class="row justify-space-between py-2">
                                                 <div class="col-lg-3 me-auto">
                                                     <p class="lead text-dark pt-1 mb-0"><?php if(!isset($result)) { echo'Choose your topic'; } else { echo $result;};?></p>
                                                 </div>
                                             </div>
                                         </div>
                                         <div class="tab-content tab-space">
                                             <div class="tab-pane active" id="preview-btn-color">
                                                 <div class="row text-center py-3 mt-3">
                                                     <div class="col-12 mx-auto">
                                                         <select name="topic" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                                                             <?php foreach ($topics as $topic) { ?>
                                                                 <option value="<?php echo $topic['topic']; ?>"><?php echo $topic['topic']; ?></option>
                                                             <?php } ?>
                                                         </select>
                                                         <button type="submit" class="btn btn-secondary">Start Quiz</button>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </form>
                         <?php } else if (isset($_SESSION['topic']) && $logged_in) { ?>
                             <!-- Questions -->
                             <div class="col-12">
                                 <div class="position-relative border-radius-xl overflow-hidden shadow-lg mb-7">
                                     <div class="container border-bottom">
                                         <div class="row justify-space-between py-2">
                                             <div class="col-lg-3 me-auto">
                                                 <p class="lead text-dark pt-1 mb-0">
                                                     <?php echo ucfirst($_SESSION['topic']); ?>
                                                 </p>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="tab-content tab-space">
                                         <div class="tab-pane active" id="preview-btn-color">
                                             <div class="row text-center py-3 mt-3">
                                                 <div class="col-12 mx-auto">

                                                     <?php
                                                        if (isset($result)) {
                                                            echo '<p class="lead text-dark pt-1 mb-0">' . $result . '</p>';
                                                        } else if (isset($_SESSION['current_question'])) {
                                                            echo '<p class="lead text-dark pt-1 mb-0">' . $current_question['question_text'] . '</p>';
                                                            echo '<form method="post">';
                                                            echo '<div class="row text-center py-2 mt-3"><div class="col-3 mx-auto text-start">';
                                                            echo '<div class="form-check">';
                                                            echo '<input class="form-check-input" type="radio" name="answer" value="1" id="flexRadioDefault1" required>';
                                                            echo '<label class="form-check-label" for="flexRadioDefault1">' . $current_question['answer-1'] . '</label>';
                                                            echo '</div>';
                                                            echo '<div class="form-check">';
                                                            echo '<input class="form-check-input" type="radio" name="answer" value="2" id="flexRadioDefault2" required>';
                                                            echo '<label class="form-check-label" for="flexRadioDefault2">' . $current_question['answer-2'] . '</label>';
                                                            echo '</div>';
                                                            echo '<div class="form-check">';
                                                            echo '<input class="form-check-input" type="radio" name="answer" value="3" id="flexRadioDefault3" required>';
                                                            echo '<label class="form-check-label" for="flexRadioDefault3">' . $current_question['answer-3'] . '</label>';
                                                            echo '</div>';
                                                            echo '<div class="form-check">';
                                                            echo '<input class="form-check-input" type="radio" name="answer" value="4" id="flexRadioDefault4" required>';
                                                            echo '<label class="form-check-label" for="flexRadioDefault4">' . $current_question['answer-4'] . '</label>';
                                                            echo '</div>';
                                                            echo '<div class="form-check">';
                                                            echo '<input class="form-check-input" type="radio" name="answer" value="5" id="flexRadioDefault5" required>';
                                                            echo '<label class="form-check-label" for="flexRadioDefault5">' . $current_question['answer-5'] . '</label>';
                                                            echo '</div>';
                                                            echo '<button type="submit" name="next" class="btn btn-primary">Next Question</button>';
                                                            echo '<button type="submit" name="back" class="btn btn-primary">Last Question</button>';
                                                            echo '</div>';
                                                            echo '</div>';
                                                            echo '</form>';
                                                        }
                                                        ?>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         <?php } else { ?>
                             <div class="col-12">
                                 <div class="position-relative border-radius-xl overflow-hidden shadow-lg mb-7">
                                     <div class="container border-bottom">
                                         <div class="row justify-space-between py-2">
                                             <div class="col-lg-3 me-auto">
                                                 <p class="lead text-dark pt-1 mb-0">
                                                     Not Loggedin
                                                 </p>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="tab-content tab-space">
                                         <div class="tab-pane active" id="preview-btn-color">
                                             <div class="row text-center py-3 mt-3">
                                                 <div class="col-12 mx-auto">
                                                     <p class="lead text-dark pt-1 mb-0">
                                                         <?php echo "You need to be logged in to take the quiz!"; ?>
                                                     </p>
                                                     <a href="index.php?page=sign-in" class="btn btn-primary w-auto me-1 mb-0">Login</a>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         <?php } ?>
                     </div>
                 </div>
     </section>