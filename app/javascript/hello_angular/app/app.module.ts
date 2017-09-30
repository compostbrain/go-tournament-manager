import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';
import {HttpModule} from '@angular/http';
import {FormsModule, ReactiveFormsModule} from '@angular/forms';

import { AppComponent } from './app.component';
import { PlayerRegistrationFormComponent } from './player-registration-form/player-registration-form.component';

console.log(PlayerRegistrationFormComponent);
@NgModule({
  declarations: [
    AppComponent,
    PlayerRegistrationFormComponent
  ],
  imports: [
    BrowserModule,
    HttpModule,
    FormsModule,
    ReactiveFormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
