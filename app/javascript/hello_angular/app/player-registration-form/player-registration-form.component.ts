import { Component, OnInit } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import templateString from './player-registration-form.component.html';

@Component({
  selector: 'app-player-registration-form',
  template: templateString,
})
export class PlayerRegistrationFormComponent implements OnInit {
  registration_status = ['preliminary', 'final'];
  registrationForm: FormGroup;

  ngOnInit() {
    this.registrationForm = new FormGroup({
      'first_name': new FormControl(null, [Validators.required]),
      'last_name': new FormControl(null, [Validators.required]),
      'rank': new FormControl(null, [Validators.required]),
      'aga_number': new FormControl(null,[Validators.required]),
      'membership_exp_date': new FormControl(null, [Validators.required]),
      'rating': new FormControl(null, [Validators.required]),
      'chapter_affiliation': new FormControl(null, [Validators.required]),
      'state': new FormControl(null, Validators.required),
      'registration': new FormControl(this.registration_status[0], Validators.required)
    });
  }

  onSubmit() {
    console.log(this.registrationForm);
  }
}
